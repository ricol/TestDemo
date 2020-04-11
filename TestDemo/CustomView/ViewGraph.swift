//
//  ViewGraph.swift
//  TestDemo
//
//  Created by Ricol Wang on 10/4/20.
//  Copyright © 2020 Ricol Wang. All rights reserved.
//

import UIKit
import UICountingLabel

class ViewGraph: UIView
{
    @IBOutlet var viewMain: UIView!
    @IBOutlet weak var lblValue: UICountingLabel!
    
    let key = "stroke"
    let line_width: CGFloat = 30
    let animation_time: Double = 1
    
    var max: Int = 100
    var min: Int = 0
    private var current: Int = 0
    
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
        viewMain.layer.addSublayer(track)
        
        //show the circle
        let s = CAShapeLayer()
        s.path = path.cgPath
        s.strokeColor = UIColor.red.cgColor
        s.lineWidth = line_width
        s.fillColor = UIColor.clear.cgColor
        s.lineCap = .round
        s.strokeStart = 0
        s.strokeEnd = 0
        viewMain.layer.addSublayer(s)
        return s
    }()
    
    private lazy var animation: CABasicAnimation =
    {
        let a = CABasicAnimation(keyPath: "strokeEnd")
        a.duration = animation_time
        a.fillMode = .forwards
        a.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        a.isRemovedOnCompletion = false
        return a
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup()
    {
        Bundle.main.loadNibNamed("ViewGraph", owner: self, options: nil)
        viewMain.frame = bounds
        viewMain.backgroundColor = UIColor.clear
        addSubview(viewMain)
        let _ = NSLayoutConstraint.fullScreenConstraint(view: viewMain, parent: self)
    }
    
    // MARK: - Public Methods
    
    func updateValue(_ value: Int)
    {
        if value < min || value > max { return }
        print("update to \(value)...")
        
        //use animation to draw from current value to the new value
        animation.fromValue = CGFloat(current - min) * 1.0 / CGFloat(max - min)
        animation.toValue = CGFloat(value - min) * 1.0 / CGFloat(max - min)
        shape.removeAnimation(forKey: key)
        shape.add(animation, forKey: key)
        
        lblValue.format = "%d"
        lblValue.countFromCurrentValue(to: CGFloat(value), withDuration: animation_time)
        current = value
    }
}
