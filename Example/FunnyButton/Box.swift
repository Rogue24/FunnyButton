//
//  Box.swift
//  FunnyButton_Example
//
//  Created by aa on 2022/9/17.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

@objcMembers
public class Box: UIView {
    private var _safeFrame: CGRect = .zero
    
    public init() {
        let scale = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) / 375.0
        let wh = 70 * scale
        super.init(frame: CGRect(origin: CGPoint(x: (UIScreen.main.bounds.width - wh) * 0.5,
                                                 y: (UIScreen.main.bounds.height - wh) * 0.5),
                                 size: CGSize(width: wh, height: wh)))
        _setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateSafeFrame() {
        guard let superview = self.superview, let window = superview.window else { return }
        _safeFrame = superview.bounds.inset(by: window.safeAreaInsets)
        frame = _markSafeFrame(frame)
    }
}

private extension Box {
    func _setup() {
        backgroundColor = .systemOrange
        layer.cornerRadius = 15
        layer.masksToBounds = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(_panMe(_:))))
        
        let label = UILabel(frame: bounds)
        label.text = "🤖"
        label.font = .systemFont(ofSize: bounds.height * 0.75)
        label.textAlignment = .center
        addSubview(label)
    }
    
    func _markSafeFrame(_ frame: CGRect) -> CGRect {
        var f = frame
        
        let interFrame = _safeFrame.insetBy(dx: 16, dy: 16)
        
        if f.origin.x < interFrame.origin.x {
            f.origin.x = interFrame.origin.x
        } else if f.maxX > interFrame.maxX {
            f.origin.x = interFrame.maxX - f.width
        }
        
        if f.origin.y < interFrame.origin.y {
            f.origin.y = interFrame.origin.y
        } else if f.maxY > interFrame.maxY {
            f.origin.y = interFrame.maxY - f.height
        }
        
        return f
    }
    
    @objc func _panMe(_ panGR: UIPanGestureRecognizer) {
        guard let superView = self.superview else { return }
        
        let translation = panGR.translation(in: superView)
        panGR.setTranslation(.zero, in: superView)
        
        var frame = self.frame
        frame.origin.x += translation.x
        frame.origin.y += translation.y
        self.frame = _markSafeFrame(frame)
    }
}
