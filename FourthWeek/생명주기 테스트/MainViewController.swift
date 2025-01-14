//
//  MainViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/13/25.
//

import UIKit

class MainViewController: UIViewController {
    
    let colors: [UIColor] = [.black, .orange, .systemIndigo, .brown, .purple]

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Main",#function)
        
        view.backgroundColor = colors.randomElement()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Main",#function)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Main",#function)

    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        print("Main",#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("Main",#function)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Main",#function)

    }
 
}
