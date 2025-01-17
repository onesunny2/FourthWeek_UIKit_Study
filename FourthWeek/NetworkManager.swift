//
//  NetworkManager.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/16/25.
//

import UIKit
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
   /* func callKakaoBookTest(query: String, page: Int) -> Book {
        
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query)&size=20&page=\(page)"
        print(url, page)
        let header: HTTPHeaders = [
            "Authorization": APIKey.kakao
        ]
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: Book.self) { response in
                
                print(response.response?.statusCode)
                
                switch response.result {
                case .success(let value):
                    
                    print("Success")
                    
                    completionHandler(value)
                    
                case .failure(let error):
                    print(error)
                }
            }
    } */
    
    func callKakaoBookAPI(query: String, page: Int, completionHandler: @escaping (Book) -> Void) {
        
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query)&size=20&page=\(page)"
        print(url, page)
        let header: HTTPHeaders = [
            "Authorization": APIKey.kakao
        ]
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: Book.self) { response in
                
                print(response.response?.statusCode)
                
                switch response.result {
                case .success(let value):
                    
                    print("Success")
                    
                    completionHandler(value)
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func randomUser(completionHandler: @escaping (String) -> (Void)) {   // 클로저 안에 클로저를 사용하면서 나 좀 꺼내달라는 이유로 사용
        let url = "https://randomuser.me/api/?results=\(Int.random(in: 1...30))"
        
        AF.request(url, method: .get).responseDecodable(of: User.self) { response in
            
            print("========222222222=========")
            
            switch response.result {
                
            case .success(let value):  // 응답, 식판이 정상 작동 => 구조체를 활용할 수 있음!
                print("성공", value.results[0].name.last)
//
                let result = value.results[0].name.last
                completionHandler(result)
                
            case .failure(let error): // 응답은 잘 왔는데 식판이 이상한 경우
                print("오류")
                print(error)
            }
            
            print("========333333333=========")
        }
    }
}
