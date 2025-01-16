//
//  KakaoBookSearchViewController.swift
//  SeSACFourthWeek
//
//  Created by Jack on 1/14/25.
//

import UIKit
import Alamofire
import Kingfisher
import SnapKit

/*
 페이지네이션
 1. 스크롤이 끝날 때 쯤 다음 페이지를 요청 (page += 1 후 callRequest)
 2. 이전 내용도 확인해야해 해서 list.append로 수정
 
 - 다른 검색어를 입력한 경우, 배열 초기화
 - 다른 검색어를 입력한 경우, page도 1부터 시작해야함
 - 다른 검색어를 입력한 경우, 스크롤 맨 위로 올려야 함
 - 마지막 페이지인 경우 더 이상 호출하지 않기 / API에서 마지막 페이지인지 유무를 알려주지 않는 한 계산 로직 만들어야 함
 */

class KakaoBookSearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    var list: [BookDetail] = []
    
    var page = 1
    var isEnd = false
    var resultText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureSearchBar()
        configureTableView()
        
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureSearchBar() {
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        searchBar.delegate = self
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
        
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = 120
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(KakaoBookSearchTableViewCell.self, forCellReuseIdentifier: KakaoBookSearchTableViewCell.id)

    }
    /*
     1. 검색어
     2. 이미지 썸네일
     3. 똑같은 내용 검색했을 때
     */

    func callRequest(query: String) {
        print(#function)
        
        // guard let keyword = searchBar.text else { return }
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query)&size=20&page=\(page)"
        print(url, page)
        let header: HTTPHeaders = [
            "Authorization": APIKey.kakao
        ]
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Book.self) { response in
                
                print(response.response?.statusCode)
                
                switch response.result {
                case .success(let value):
                    
                    print("Success")
                    
                    self.isEnd = value.meta.is_end
                    
                    if self.page == 1 {
                        self.list = value.documents
                    } else {
                        // page 1 1-20 추가, 2 21-40 추가
                        self.list.append(contentsOf: value.documents)
                    }

                    self.tableView.reloadData()
                    
                    if self.page == 1 {
                        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }

}

extension KakaoBookSearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        // 검색버튼 클릭 시 무조건 통신되지 않도록 하고,
            // 빈칸, 최소 1자 이상, 같은 글자에 대한 처리 필요
        // 스위프트 쿼리를 통해 카카오 책 API 호출
        guard let keyword = searchBar.text else { return }
        resultText = keyword
        page = 1
        callRequest(query: resultText)
    }
    
}

extension KakaoBookSearchViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print(#function, indexPaths)
        
        // 반복문을 돌면서 마지막 indexpath를 찾을 것임
        // 20개 size => 조회 가능한 마지막은 [0,19]
        //
        for item in indexPaths {
            // 조금이라도 빨리 호출하기 위해서 -2, -3까지 하는 사람들도 있음
            if list.count - 2 == item.row && isEnd == false {  // 시작점이 0부터라서 항상 1씩 차이가 남 (화면에 보이는 row 기준) => 사용자의 마지막 스크롤 시점
                page += 1
                callRequest(query: resultText)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print(#function, indexPaths)
    }
}


extension KakaoBookSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = list.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KakaoBookSearchTableViewCell.id, for: indexPath) as? KakaoBookSearchTableViewCell else { return UITableViewCell() }
        
        let data = list[indexPath.row]
        let url = data.thumbnail
        
        cell.titleLabel.text = data.title
        cell.subTitleLabel.text = data.price.formatted()
        cell.overviewLabel.text = data.contents
        cell.thumbnailImageView.kf.setImage(with: URL(string: url))
//        print(#function, indexPath)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        print(#function, indexPath)
//    }
    
    
    // UIScrollViewDelegate에 들어있음 - tableView가 상속받고 있어서 delegate를 사용하기만 해도 쓸 수 있음
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(#function, scrollView.contentSize.height, scrollView.contentOffset.y)
//    }
    
    
}

