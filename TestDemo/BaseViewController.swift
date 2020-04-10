//
//  BaseViewController.swift
//  TestDemo
//
//  Created by Ricol Wang on 10/4/20.
//  Copyright © 2020 Ricol Wang. All rights reserved.
//

import iOSCommon
import UIKit

class BaseViewController: UIViewController
{
    var bgImage: UIImage?
    var bgImageView: UIImageView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let image = UIImage(named: "Component BG")
        {
            let imageView = UIImageView(image: image)
            view.addSubview(imageView)
            let _ = NSLayoutConstraint.fullScreenConstraint(view: imageView, parent: view)
            view.sendSubviewToBack(imageView)
            bgImage = image
            bgImageView = imageView
            image.blurEffect()
        }
    }
}
