//
//  BookCollectionViewCell.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/13/25.
//

import UIKit
import SnapKit

class BookCollectionViewCell: UICollectionViewCell {
    
    let bookCoverImageView = UIImageView()
    
    // viewDidLoad, awakeFromNib과 비슷한 역할
    override init(frame: CGRect) {
        super.init(frame: frame)  // 여기까지는 사실상 viewDidLoad랑 동일
        
        // ✅✅⭐️⭐️✅✅ 셀에는 contentView가 존재! 여기에다가 뷰를 추가해주어야 액션이 동작합니다.
        contentView.addSubview(bookCoverImageView)
        
        bookCoverImageView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)  // 알아서 셀 기준으로 영역을 잡음
        }
        
        bookCoverImageView.backgroundColor = .systemIndigo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

