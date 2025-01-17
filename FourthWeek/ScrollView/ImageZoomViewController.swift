//
//  ImageZoomViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/17/25.
//

import UIKit
import SnapKit

class ImageZoomViewController: UIViewController {
    
    private lazy var scrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemIndigo
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.bouncesVertically = false // 밀고 당겼을 때 배경 안보이도록
        view.bouncesHorizontally = false
        view.maximumZoomScale = 5
        view.minimumZoomScale = 1
        view.delegate = self
        
        return view
    }()
    
    private let imageView = {
            let view = UIImageView(frame: .zero)
            view.backgroundColor = .yellow
            view.image = UIImage(systemName: "star")
            view.contentMode = .scaleAspectFit
            view.isUserInteractionEnabled = true
            return view
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        scrollView.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.center.equalTo(view)
        }
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(scrollView)
        }
        
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(doubleTapGesture))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
    }

    // 배율 1배율 -> 2배, 아니면 원래대로
    @objc
    func doubleTapGesture() {
        
        if scrollView.zoomScale == 1 {
            scrollView.setZoomScale(3, animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
    
}


extension ImageZoomViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
