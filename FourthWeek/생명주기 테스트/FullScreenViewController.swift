//
//  FullScreenViewController.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/13/25.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    let colors: [UIColor] = [.black, .orange, .systemIndigo, .brown, .purple]

    @IBOutlet var fullScreenDismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("FullScreen",#function)
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("FullScreen",#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("FullScreen",#function)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        print("FullScreen",#function)    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("FullScreen",#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("FullScreen",#function)
    }

    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
