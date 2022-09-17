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
        title = "Hello"
        
        view.backgroundColor = .systemTeal
        
        let btn1: UIButton = {
            let btn = UIButton(type: .system)
            btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
            btn.setTitle("基本使用", for: .normal)
            btn.setTitleColor(.orange, for: .normal)
            btn.backgroundColor = .systemYellow
            btn.layer.cornerRadius = 8
            btn.layer.masksToBounds = true
            btn.frame = CGRect(x: 50, y: 300, width: 100, height: 35)
            btn.addTarget(self, action: #selector(didClickBtn1), for: .touchUpInside)
            return btn
        }()
        view.addSubview(btn1)
        
        let btn2: UIButton = {
            let btn = UIButton(type: .system)
            btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
            btn.setTitle("兼容OC", for: .normal)
            btn.setTitleColor(.systemBlue, for: .normal)
            btn.backgroundColor = .systemYellow
            btn.layer.cornerRadius = 8
            btn.layer.masksToBounds = true
            btn.frame = CGRect(x: 50, y: 350, width: 100, height: 35)
            btn.addTarget(self, action: #selector(didClickBtn2), for: .touchUpInside)
            return btn
        }()
        view.addSubview(btn2)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        replaceFunnyAction {
            print("点我干森莫")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeFunnyActions()
    }
}

extension ViewController {
    @objc func didClickBtn1() {
        navigationController?.pushViewController(JPViewController(), animated: true)
    }
    
    @objc func didClickBtn2() {
        navigationController?.pushViewController(OCViewController(), animated: true)
    }
}
