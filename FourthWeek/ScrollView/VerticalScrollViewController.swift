//
//  VerticalScrollViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/17/25.
//

import UIKit
import SnapKit

class VerticalScrollViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let imageView = UIImageView()
    let label = UILabel()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        configureLayout()
        configureContentView()
    }
    
    func configureLayout() {
        scrollView.backgroundColor = .lightGray
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.backgroundColor = .systemMint
        contentView.snp.makeConstraints { make in
//            make.edges.equalTo(scrollView)  // 현재 아무 콘텐츠가 없기 때문에 그 빈공간만큼 줄어들었기 때문! 반대로 이 상태로 콘텐츠 내용을 horizontal로 무한으로 늘리면 그만큼 원하지 않는 형태로 늘어나게 됨. 반대로 수평 스크롤을 하고 싶으면 스크롤뷰의 높이에 맞게 기준을 잡아야 함
            make.width.equalTo(scrollView.snp.width)
            make.verticalEdges.equalTo(scrollView)
        }
    }
    
    func configureContentView() {
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.addSubview(button)
        
        label.backgroundColor = .orange
        imageView.backgroundColor = .black
        button.backgroundColor = .systemIndigo
        
        label.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(900)
        }
        
        imageView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(200)
        }
        
        // 버튼은 유동적인 사이즈가 되도록 설정됨
        button.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.top.equalTo(label.snp.bottom).offset(50)
            make.bottom.equalTo(imageView.snp.top).offset(-50)
        }
    }
    
}
