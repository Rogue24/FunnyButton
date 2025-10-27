//
//  ViewController.swift
//  FunnyButton
//
//  Created by zhoujianping on 09/17/2022.
//  Copyright (c) 2022 zhoujianping. All rights reserved.
//

import UIKit
import FunnyButton

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FunnyButton.shared
        
        // 不让 FunnyButton 参与截屏和录屏
        FunnyButton.isScreenCaptureAllowed = false
        
        title = "Hello"
        view.backgroundColor = .systemTeal
        
        let btn1 = buildBtn("基本使用", .systemPink, .systemYellow, 200, #selector(didClickBtn1))
        view.addSubview(btn1)
        
        let btn2 = buildBtn("兼容OC", .systemBlue, .systemYellow, 250, #selector(didClickBtn2))
        view.addSubview(btn2)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        removeFunnyActions()
        addFunnyAction(name: "基本使用") { [weak self] in
            self?.didClickBtn1()
        }
        addFunnyAction(name: "兼容OC") { [weak self] in
            self?.didClickBtn2()
        }
    }
    
    private func buildBtn(_ title: String, _ titleColor: UIColor, _ bgColor: UIColor, _ y: CGFloat, _ action: Selector) -> UIButton {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.backgroundColor = bgColor
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.frame = CGRect(x: 50, y: y, width: 100, height: 35)
        btn.addTarget(self, action: action, for: .touchUpInside)
        return btn
    }
}

private extension ViewController {
    @objc func didClickBtn1() {
        navigationController?.pushViewController(JPViewController(), animated: true)
    }
    
    @objc func didClickBtn2() {
        navigationController?.pushViewController(OCViewController(), animated: true)
    }
}
