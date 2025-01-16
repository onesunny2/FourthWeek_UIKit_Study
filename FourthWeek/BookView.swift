//
//  BookView.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/16/25.
//

import UIKit
import SnapKit

class BookView: BaseView {
    
    
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical

        return layout
    }
    
    override func configureHierarchy() {
        self.addSubview(collectionView)  // self도 생략해도 무방
    }
    
    override func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func configureView() {
        backgroundColor = .orange
        
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "BookCollectionViewCell")
    }
}
