//
//  Market.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/15/25.
//

import Foundation

/*
 서버에서 키를 바꾸면 앱이 터진다...
 - optional을 통한 해결
 */

struct Market: Decodable {
    let name: String?
    let market: String
    let korean: String
    let english: String
    
    enum CodingKeys: String, CodingKey {
        case market
        case name
        case korean = "korean_name"
        case english = "english_name"
    }
}
