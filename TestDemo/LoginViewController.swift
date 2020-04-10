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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    
    let username = "climber@gmail.com"
    let password = "climber"
    let animation_time: TimeInterval = 0.3
    var originalValue: CGFloat?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnLogin.startColor = UIColor(hexString: "5D9DFF")
        btnLogin.endColor = UIColor(hexString: "9EBCEA")
        btnLogin.roundCornersForRadius(radius: 15)
        btnLogin.alpha = 0.5
        btnLogin.isEnabled = false
    
        tfUserName.placeholder = "Username"
        tfUserName.placeholderColor = UIColor.appTextFieldPlaceholder()
        tfUserName.titleColor = UIColor.appTextFieldPlaceholder()
        tfUserName.textColor = UIColor.appTextFieldContent()
        tfUserName.lineColor = UIColor.appTextFieldContent()
        tfUserName.selectedTitleColor = UIColor.appTextFieldPlaceholder()
        tfUserName.selectedLineColor = UIColor.appTextFieldContent()
        
        tfPassword.placeholder = "Password"
        tfPassword.isSecureTextEntry = true
        tfPassword.placeholderColor = UIColor.appTextFieldPlaceholder()
        tfPassword.titleColor = UIColor.appTextFieldPlaceholder()
        tfPassword.textColor = UIColor.appTextFieldContent()
        tfPassword.lineColor = UIColor.appTextFieldContent()
        tfPassword.selectedTitleColor = UIColor.appTextFieldPlaceholder()
        tfPassword.selectedLineColor = UIColor.appTextFieldContent()
        
        tfUserName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        tfPassword.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        self.originalValue = self.constraintBottom.constant
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notif:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notif:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField)
    {
        if let username = tfUserName.text, let password = tfPassword.text
        {
            let verified = username == self.username && password == self.password
            UIView.animate(withDuration: animation_time) {
                self.btnLogin.alpha = verified ? 1 : 0.5
            }
            btnLogin.isEnabled = verified
        }
    }
    
    @objc func keyboardWillShow(notif: NSNotification)
    {
        if let keyboardSize = (notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, let value = self.originalValue
        {
            self.constraintBottom.constant = value + keyboardSize.height
            UIView.animate(withDuration: animation_time) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notif: NSNotification)
    {
        if let v = self.originalValue
        {
            self.constraintBottom.constant = v
            UIView.animate(withDuration: animation_time) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func btnLoginOnTapped(_ sender: Any)
    {
        if let vc = UIStoryboard(name: "Main", bundle: nil).getVC(vc: "MainViewController") as? MainViewController
        {
            self.navigationController?.pushViewController(vc, animated: true)
            self.view.endEditing(true)
        }
    }
}
