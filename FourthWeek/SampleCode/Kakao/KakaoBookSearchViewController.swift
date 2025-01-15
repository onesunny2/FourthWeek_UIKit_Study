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

class KakaoBookSearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    var list: [BookDetail] = []

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
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query)&size=20"
        let header: HTTPHeaders = [
            "Authorization": APIKey.kakao
        ]
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Book.self) { response in
                
                print(response.response?.statusCode)
                
                switch response.result {
                case .success(let value):
                    
                    
                    if self.list == value.documents {
                        print("again")
                    } else {
                        print("success")
                        self.list = value.documents
                        self.tableView.reloadData()
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
        
        // 스위프트 쿼리를 통해 카카오 책 API 호출
        guard let keyword = searchBar.text else { return }
        callRequest(query: keyword)
        
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
        
        return cell
    }
    
}

