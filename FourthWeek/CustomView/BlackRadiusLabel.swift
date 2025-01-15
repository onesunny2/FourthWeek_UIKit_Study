//
//  BlackRadiusLabel.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/15/25.
//

import UIKit

// protocol도 초기화를 강제할 수 있음
protocol SeSAC {
    init()
}

class Mentor: SeSAC {
    
    required init() {
        print("Mentor Init")
    }
}

class Jack: Mentor {
    
    // 부모쪽에서 초기화가 있으면 override가 있고, 부모의 초기화를 호출하려면 super.이 필요함
    required init() {
        super.init()
        print("Jack Init")
    }
}

class BaseLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class pointButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BlackRadiusLabel: BaseLabel {
    
    // 이렇게 하면 아래에 있던 super.init이 사라져서 오류가 뜨는 것
    init(color: UIColor) {
        super.init(frame: .zero)
        
        font = .boldSystemFont(ofSize: 15)
        textColor = color
        backgroundColor = .black
        layer.cornerRadius = 10
        clipsToBounds = true
        textAlignment = .center
    }
    
    // 코드베이스로 코드를 구성할 때 호출되는 초기화 구문
    // UILabel(super class, 부모)로부터 구현된 init
//    override init(frame: CGRect) {  // 처음 좌표와 높이에 대한 정보를 담고 있음
//        
//
//    }
//    
    // 스토리보드로 구성할 때 호출되는 구문
    // 슈퍼클래스가 아니라 프로토콜에 있구나! (protocol에 구현된 init => required Initializer)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
