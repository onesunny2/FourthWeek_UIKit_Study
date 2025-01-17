//
//  UserDafaultsManager.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/16/25.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()  // 영영 살아있는 하나의 공간 (데이터의 크기와 빈도에 따라 채택)
    
    private init() { }
    
    var age: Int {
        get {
            UserDefaults.standard.integer(forKey: "age")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "age")
        }
    }
    
    var nickname: String {
        get {
            UserDefaults.standard.string(forKey: "name") ?? "대장"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
}
