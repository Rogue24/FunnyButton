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
        view.backgroundColor = .darkGray
        view.addSubview(box)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        box.updateSafeFrame()
        
        addFunnyAction { [weak self] in
            guard let self = self else { return }
            print("box.frame --- \(self.box.frame)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeFunnyActions()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async { [weak self] in
            self?.box.updateSafeFrame()
        }
    }
    
}
