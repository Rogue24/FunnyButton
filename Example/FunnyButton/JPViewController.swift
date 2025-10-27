//
//  JPViewController.swift
//  FunnyButton_Example
//
//  Created by aa on 2022/9/17.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import FunnyButton

class JPViewController: UIViewController {
    
    let box = Box()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "基本使用"
        view.backgroundColor = .systemPink
        view.addSubview(box)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        box.updateSafeFrame()
        
        replaceFunnyAction { [weak self] in
            guard let self = self else { return }
            print("box.frame --- \(self.box.frame)")
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async { [weak self] in
            self?.box.updateSafeFrame()
        }
    }
    
}
