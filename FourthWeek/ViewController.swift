//
//  ViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/13/25.
//

import UIKit

/*
 1. 스토리보드에서 객체 얹이기
 2. 객체 레이아웃 잡기
 3. 아웃렛 연결하기
 4. 객체 속성 코드로 조절하기
 */

class ViewController: UIViewController {
    
    // 1. 아웃렛 연결하기 (class 인스턴스로 잡아서 연결)
    let emailTextField = UITextField()  // @IBOutlet var emailnTextField: UITextField!
    let passwordTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(passwordTextField)
        // ⭐️⭐️⭐️ 이걸 설정하지 않으면 오토레이아웃 적용이 안됨!
        passwordTextField.translatesAutoresizingMaskIntoConstraints = true
        passwordTextField.borderStyle = .bezel
        
        let top = NSLayoutConstraint(item: passwordTextField,
                                     attribute: .top, /* item의 위쪽에 여백을 줄거야 */
                                     relatedBy: .equal,
                                     toItem: view.safeAreaLayoutGuide, /* 누구 기준으로 잡을건데? */
                                     attribute: .top, /* view.safeAreaLayoutGuide 중에서도 가장 상단을 기준으로 잡을거야 */
                                     multiplier: 1,
                                     constant: 50)
        NSLayoutConstraint(item: passwordTextField,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide, /* 누구 기준으로 잡을건데? */
                           attribute: .leading,
                           multiplier: 1,
                           constant: 40).isActive = true
        
        NSLayoutConstraint(item: passwordTextField,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide, /* 누구 기준으로 잡을건데? */
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -40).isActive = true
        
        NSLayoutConstraint(item: passwordTextField,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil, /* 누구 기준으로 잡을건데? - 비교대상이 없어서 nil */
                           attribute: .height,
                           multiplier: 1,
                           constant: 50).isActive = true
        
        top.isActive = true
        
        frameBasedLayout()
    }

    func frameBasedLayout() {
        // 2. 바탕 뷰한테 객체 연결을 요청해야함
        view.addSubview(emailTextField)
        // 3. 객체 레이아웃 잡기
        emailTextField.frame = CGRect(x: 50, y: 100, width: 293, height: 40)
        // 4. 뷰 속성 조절
        emailTextField.borderStyle = .bezel
    }
}
