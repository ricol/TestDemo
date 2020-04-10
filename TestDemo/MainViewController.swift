//
//  MainViewController.swift
//  TestDemo
//
//  Created by Ricol Wang on 10/4/20.
//  Copyright © 2020 Ricol Wang. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController
{
    @IBOutlet weak var imageViewProfile: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bgImageView?.image = nil
        if let image = bgImage
        {
            image.blurEffect(key: "bgimage", radius: 80, complete: { (image) in
                let delta: CGFloat = 130
                self.bgImageView?.image = image.croppedImage(rect: CGRect(x: delta, y: delta, width: image.size.width - 2 * delta, height: image.size.height - 2 * delta))
            })
        }
        
        imageViewProfile.roundCorners()
    }

    @IBAction func btnProfileOnTapped(_ sender: Any)
    {
        self.navigationController?.pop(animated: true)
    }
}
