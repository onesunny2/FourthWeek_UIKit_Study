//
//  RandomViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/14/25.
//

import UIKit
import SnapKit
import Alamofire

struct Dog: Decodable {
    let message: String
    let status: String
}

struct Lotto: Decodable {  // 가져오고 싶은 정보만 필터링해도 됨!
    let drwNoDate: String
    let firstWinamnt: Int
}

struct User: Decodable {
    let results: [UserDetail]
}

struct UserDetail: Decodable {
    let gender: String
    let email: String
    let name: UserName
}

struct UserName: Decodable {
    let first: String
    let last: String
}

protocol ViewConfiguration: AnyObject {
    func configureHierarchy()  // addSubview
    func configureLayout()  // snapKit
    func configureView()  // property
}

class RandomViewController: UIViewController , ViewConfiguration {

    let randomImageView = UIImageView()
    let nameLabel = UILabel()
    let randomButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        // 호출 순서에 유의하자
        configureHierarchy()
        configureLayout()
        configureView()
    }
 
    func configureHierarchy() {
        view.addSubview(randomImageView)
        view.addSubview(nameLabel)
        view.addSubview(randomButton)
    }
    
    func configureLayout() {
        randomImageView.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(randomImageView.snp.bottom).offset(20)
        }
        
        randomButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
    }
    
    func configureView() {
        randomImageView.backgroundColor = .brown
        nameLabel.backgroundColor = .systemGreen
        randomButton.backgroundColor = .systemIndigo
        randomButton.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func randomButtonTapped() {
        print("========111111111=========")
        // 버튼을 누르면 랜덤으로 강아지 나오게 (고양이 하고싶다)
        // 인터넷에서 엔터키 눌렀을 때 처럼 요청하는 부분
        let url = "https://dog.ceo/api/breeds/image/random"
        // 아래는 잘 출력되는지 확인하는 과정으로 사용
        /* AF.request(url, method: .get).responseString { value in
            print(value)
        } */  // get이 default라서 다른 행위로 바꾸지 않는 한 명세하지 않아도 무방
        AF.request(url, method: .get).responseDecodable(of: Dog.self) { response in
            
            print("========222222222=========")
            
            switch response.result {
                
            case .success(let value):  // 응답, 식판이 정상 작동 => 구조체를 활용할 수 있음!
                print("성공")
                self.nameLabel.text = value.message  // nameLabel은 우리가 만든건데, AF안에 nameLabel과 같은 애가 없다는 보장이 없기 때문에 내가 만든 nameLabel이라는 것을 명시하기 위해 self. 붙인다고 지금은 생각하기
                // KF 사용해서 이미지 넣으면 사진도 정상 작동 할 것
                
            case .failure(let error): // 응답은 잘 왔는데 식판이 이상한 경우
                print("오류")
                print(error)
            }
            
            print("========333333333=========")
        }
        
        print("========444444444=========")
    }
    
    @objc
    func lottoButtonTapped() {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(Int.random(in: 800...1154))"
        
        AF.request(url, method: .get)
            .responseDecodable(of: Lotto.self) { response in
            
            print("========222222222=========")
            
            switch response.result {
                
            case .success(let value):
                print("성공")
                print(value)
                self.nameLabel.text = value.drwNoDate + " & " + value.firstWinamnt.formatted()
                
            case .failure(let error):
                print("오류")
                print(error)
            }
            
            print("========333333333=========")
        }
    }
    
    @objc
    func userButtonTapped() {
//        NetworkManager.shared.randomUser(completionHandler: <#(String) -> (Void)#>)
    }
    
}
