//
//  LoginButton.swift
//  TestDemo
//
//  Created by Ricol Wang on 10/4/20.
//  Copyright © 2020 Ricol Wang. All rights reserved.
//

import UIKit

class LoginButton: UIButton
{
    override class func awakeFromNib()
    {
        super.awakeFromNib()
    }

    var startColor: UIColor?
    {
        didSet
        {
            updateGradientLayer()
        }
    }

    var endColor: UIColor?
    {
        didSet
        {
            updateGradientLayer()
        }
    }

    var startPoint: CGPoint = CGPoint.zero
    {
        didSet
        {
            updateGradientLayer()
        }
    }

    private var _endPoint: CGPoint?
    var endPoint: CGPoint
    {
        get
        {
            if let value = _endPoint
            {
                return value
            }
            else
            {
                return CGPoint(x: 1, y: 0)
            }
        }

        set
        {
            _endPoint = newValue

            updateGradientLayer()
        }
    }

    public override class var layerClass: Swift.AnyClass
    {
        return CAGradientLayer.self
    }

    private func updateGradientLayer()
    {
        if let g = layer as? CAGradientLayer, let startColor = startColor, let endColor = endColor
        {
            g.colors = [startColor.cgColor, endColor.cgColor]
            g.startPoint = startPoint
            g.endPoint = endPoint
        }
    }
}
