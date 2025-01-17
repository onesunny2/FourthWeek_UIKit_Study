//
//  InstrinsicContentsizeViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/16/25.
//

import UIKit

class IntrinsicContentsizeViewController: UIViewController {
    
    let label = UILabel()
    let image = UIImageView()
    let uiview = UIView()
    let button = UIButton()
    let segment = UISegmentedControl()
    let picker = UIPickerView()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        print(label.intrinsicContentSize)
        print(image.intrinsicContentSize)
        print(uiview.intrinsicContentSize)
        print(button.intrinsicContentSize)
        print(segment.intrinsicContentSize)
        print(picker.intrinsicContentSize)
        print(tableView.intrinsicContentSize)
    }

}
