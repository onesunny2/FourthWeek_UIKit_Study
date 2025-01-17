//
//  BookViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/13/25.
//

import UIKit
import SnapKit

class BookViewController: UIViewController {
    
    var mainView = BookView()
    
    // ⭐️ 절대로 슈퍼뷰를 호출하지 말 것!
    override func loadView() {  // loadView - viewDidLoad 순서로 호출
        view = mainView
    }
    
    
    // tableView 같은 것도 검색해보기 (programmingly라고 검색하면 코드베이스 많이 나옴)
    override func viewDidLoad() {
        super.viewDidLoad()
       
        UserDefaultsManager.shared.age = 50
        
        NetworkManager.shared.randomUser { name in
            
        } // 여기서는 알라모 Import 안해도 됨
        
        navigationItem.title = ""  // ??? 어떻게 꺼내오지
    }
  
}


