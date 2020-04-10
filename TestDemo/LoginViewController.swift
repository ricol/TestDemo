//
//  LoginViewController.swift
//  TestDemo
//
//  Created by Ricol Wang on 10/4/20.
//  Copyright © 2020 Ricol Wang. All rights reserved.
//

import SkyFloatingLabelTextField
import UIKit
import SwiftHEXColors

class LoginViewController: BaseViewController
{
    @IBOutlet var tfPassword: SkyFloatingLabelTextField!
    @IBOutlet var tfUserName: SkyFloatingLabelTextField!
    @IBOutlet var btnLogin: LoginButton!
    
    let username = "climber@gmail.com"
    let password = "climber"

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnLogin.startColor = UIColor(hexString: "5D9DFF")
        btnLogin.endColor = UIColor(hexString: "9EBCEA")
        btnLogin.roundCornersForRadius(radius: 15)
        btnLogin.alpha = 0.5
    
        tfUserName.placeholder = "Username"
        tfPassword.placeholder = "Password"
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
    @IBAction func btnLoginOnTapped(_: Any)
    {}
}
