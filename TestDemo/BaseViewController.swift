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
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
