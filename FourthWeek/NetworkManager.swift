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
