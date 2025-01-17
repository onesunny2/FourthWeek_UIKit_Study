//
//  HorizontalScrollViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/17/25.
//

import UIKit
import SnapKit

class HorizontalScrollViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.backgroundColor = .yellow
        
        scrollView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide) // 수평이랑 반대로 잡음
            make.height.equalTo(50)
        }
        
        // 가로 스크롤을 위한 레이아웃 잡기
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.height.equalTo(50)
        }
        
        stackView.spacing = 10
        
        configureLabel()
    }
    
    func configureLabel() {
        let label = UILabel()
        label.backgroundColor = .orange
        label.text = "slafdsafdsafdsafdafdsafdsafdsafdfsafdsa"
        stackView.addArrangedSubview(label)  // 스택뷰에 label이 달렸다는 것은 알아서 너비가 결정될 것이기 때문에 따로 레이아웃을 잡지 않을 것임!
        
        let label2 = UILabel()
        label2.backgroundColor = .brown
        label2.text = "slafds"
        stackView.addArrangedSubview(label2)
        
        let label3 = UILabel()
        label3.text = "33456"
        label3.backgroundColor = .orange
        label3.textColor = .white
        stackView.addArrangedSubview(label3)
        
        let label4 = UILabel()
        label4.text = "34354aasdfsadssafdsafdsa53456"
        label4.backgroundColor = .orange
        label4.textColor = .white
        stackView.addArrangedSubview(label4)
        
        let label5 = UILabel()
        label5.text = "3435453456"
        label5.backgroundColor = .orange
        label5.textColor = .white
        stackView.addArrangedSubview(label5)
    }

}
