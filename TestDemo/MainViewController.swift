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
    @IBOutlet weak var graph: ViewGraph!
    
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
        graph.backgroundColor = UIColor.clear
        graph.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        graph.updateValue(20)
    }
    
    @objc func handleTap()
    {
        let base = graph.max - graph.min
        let number = Int(arc4random() % UInt32(base)) + graph.min
        graph.updateValue(number)
    }
    
    @IBAction func btnProfileOnTapped(_ sender: Any)
    {
        self.navigationController?.pop(animated: true)
    }
}
