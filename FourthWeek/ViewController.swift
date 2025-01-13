//
//  ViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/13/25.
//

import UIKit
import SnapKit

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
    let nameTextField = UITextField()
    
    let redView = UIView()
    let greenView = UIView()
    let grayView = UIView()
    
    let btn = UIButton()
    
    var nextButton3: UIButton {
        print("Button 버튼버튼")
        btn.setTitle("다음으로", for: .normal)
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }
    
    var nextButton2: UIButton {
        let btn = UIButton()
        print("Button 버튼버튼")
        btn.setTitle("다음으로", for: .normal)
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }
    
    lazy var nextButton = {
        let btn = UIButton()
        print("Button 버튼버튼")
        btn.setTitle("다음으로", for: .normal)
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc
    func nextButtonTapped() {
        print(#function)
        
        let vc = BookViewController()
        present(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
 
        frameBasedLayout()
        autoLayoutConstraints()
        autoLayoutAnchor()
        
        autoLayoutSnapKit2()
        configureButton()
        
//        autoLayoutSnapKit()
        
    }
    
    func configureButton() {
        view.addSubview(nextButton3)
        
        nextButton3.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.height.equalTo(50)
        }
    }
    

    
    func autoLayoutSnapKit2() {
        view.addSubview(redView)
        view.addSubview(grayView)
        redView.addSubview(greenView)
        
        redView.backgroundColor = .red
        grayView.backgroundColor = .gray
        greenView.backgroundColor = .green
        
        redView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalToSuperview()
        }
        
        greenView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        grayView.snp.makeConstraints { make in
            make.edges.equalTo(redView).inset(60)
        }
    }
    
    func autoLayoutSnapKit() {
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(grayView)
        
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        grayView.backgroundColor = .gray
        
        redView.snp.makeConstraints { make in
            /* make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.verticalEdges.equalTo(view.safeAreaLayoutGuide) */
            // 위 2줄을 아래로 퉁치기 가능
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(50)
//            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
//            make.bottom.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        greenView.snp.makeConstraints { make in
            /* make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalTo(view.safeAreaLayoutGuide) */
            // 마찬가지로 위 2줄을 퉁칠 수 있음
            // make.centerX.centerY.equalTo(view.safeAreaLayoutGuide)
            // 위로 줄인걸 아래처럼 사용 가능
            make.center.equalTo(view.safeAreaLayoutGuide)
           /* make.width.equalTo(200)
            make.height.equalTo(200) */
            // 아래처럼 위 2줄 퉁칠 수 있음
            make.size.equalTo(200)
        }
        
        grayView.snp.makeConstraints { make in
            make.top.equalTo(greenView.snp.bottom).offset(50)
            make.centerX.equalTo(greenView.snp.centerX).offset(25)
            make.size.equalTo(200)
        }
    }

    func frameBasedLayout() {
        // 2. 바탕 뷰한테 객체 연결을 요청해야함
        view.addSubview(emailTextField)
        // 3. 객체 레이아웃 잡기
        emailTextField.frame = CGRect(x: 50, y: 100, width: 293, height: 40)
        // 4. 뷰 속성 조절
        emailTextField.borderStyle = .bezel
    }
    
    func autoLayoutConstraints() {
        view.addSubview(passwordTextField)
        // ⭐️⭐️⭐️ 이걸 설정하지 않으면 오토레이아웃 적용이 안됨!
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .bezel
        
        let top = NSLayoutConstraint(item: passwordTextField,
                                     attribute: .top, /* item의 위쪽에 여백을 줄거야 */
                                     relatedBy: .equal,
                                     toItem: view.safeAreaLayoutGuide, /* 누구 기준으로 잡을건데? */
                                     attribute: .top, /* view.safeAreaLayoutGuide 중에서도 가장 상단을 기준으로 잡을거야 */
                                     multiplier: 1,
                                     constant: 50)
        let leading = NSLayoutConstraint(item: passwordTextField,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide, /* 누구 기준으로 잡을건데? */
                           attribute: .leading,
                           multiplier: 1,
                           constant: 40)
        
        let trailing = NSLayoutConstraint(item: passwordTextField,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide, /* 누구 기준으로 잡을건데? */
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -40)
        
        let height = NSLayoutConstraint(item: passwordTextField,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil, /* 누구 기준으로 잡을건데? - 비교대상이 없어서 nil */
                           attribute: .height,
                           multiplier: 1,
                           constant: 50)
        
        view.addConstraints([top, leading, trailing, height])
    }
    
    func autoLayoutAnchor() {
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor), /* view의 센터랑 똑같이 맞출래 */
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            nameTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        nameTextField.backgroundColor = .systemIndigo
    }
}
