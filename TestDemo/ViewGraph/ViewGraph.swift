//
//  ViewGraph.swift
//  TestDemo
//
//  Created by Ricol Wang on 10/4/20.
//  Copyright © 2020 Ricol Wang. All rights reserved.
//

import UIKit

class ViewGraph: UIView
{
    let key = "stroke"
    let line_width: CGFloat = 30
    
    var max: CGFloat = 100
    var min: CGFloat = 0
    private var current: CGFloat = 0
    
    private lazy var shape: CAShapeLayer =
    {
        let track = CAShapeLayer()
        
        //show track background
        let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width / 2.0, y: self.bounds.height / 2.0), radius: self.bounds.size.width / 2.0, startAngle: CGFloat.pi, endAngle: 3 * CGFloat.pi, clockwise: true)
        track.path = path.cgPath
        track.strokeColor = UIColor.lightGray.cgColor
        track.lineWidth = line_width
        track.fillColor = UIColor.clear.cgColor
        track.strokeStart = 0
        track.strokeEnd = 1
        self.layer.addSublayer(track)
        
        //show the circle
        let s = CAShapeLayer()
        s.path = path.cgPath
        s.strokeColor = UIColor.red.cgColor
        s.lineWidth = line_width
        s.fillColor = UIColor.clear.cgColor
        s.lineCap = .round
        s.strokeStart = 0
        s.strokeEnd = 0
        self.layer.addSublayer(s)
        return s
    }()
    
    private lazy var animation: CABasicAnimation =
    {
        let a = CABasicAnimation(keyPath: "strokeEnd")
        a.duration = 1
        a.fillMode = .forwards
        a.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        a.isRemovedOnCompletion = false
        return a
    }()
    
    func updateValue(_ value: CGFloat)
    {
        print("update to \(value)...")
        
        //use animation to draw from current value to the new value
        animation.fromValue = (current - min) * 1.0 / (max - min)
        animation.toValue = (value - min) * 1.0 / (max - min)
        shape.removeAnimation(forKey: key)
        shape.add(animation, forKey: key)
        
        current = value
    }
}
