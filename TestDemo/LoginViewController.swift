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
//        btnLogin.isEnabled = false
    
        tfUserName.placeholder = "Username"
        tfUserName.placeholderColor = UIColor.appTextFieldPlaceholder()
        tfUserName.titleColor = UIColor.appTextFieldPlaceholder()
        tfUserName.textColor = UIColor.appTextFieldContent()
        tfUserName.lineColor = UIColor.appTextFieldContent()
        tfUserName.selectedTitleColor = UIColor.appTextFieldPlaceholder()
        tfUserName.selectedLineColor = UIColor.appTextFieldContent()
        
        tfPassword.placeholder = "Password"
        tfPassword.placeholderColor = UIColor.appTextFieldPlaceholder()
        tfPassword.titleColor = UIColor.appTextFieldPlaceholder()
        tfPassword.textColor = UIColor.appTextFieldContent()
        tfPassword.lineColor = UIColor.appTextFieldContent()
        tfPassword.selectedTitleColor = UIColor.appTextFieldPlaceholder()
        tfPassword.selectedLineColor = UIColor.appTextFieldContent()
        
        tfUserName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        tfPassword.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField)
    {
        if let username = tfUserName.text, let password = tfPassword.text
        {
            let verified = username == self.username && password == self.password
            btnLogin.alpha = verified ? 1 : 0.5
            btnLogin.isEnabled = verified
        }
    }

    @IBAction func btnLoginOnTapped(_: Any)
    {
        
    }
}
