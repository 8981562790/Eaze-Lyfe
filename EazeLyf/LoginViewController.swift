//
//  LoginViewController.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 24/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SnapKit

class LogInViewController: BaseViewController, UITextFieldDelegate {
    
    let loginButton = ESubmitFormUIButton()
    let signUpButton = ESubmitFormUIButton()
    let mobileNumberTextField = ETextField()
    let passwordTextField = ETextField()
    let forgotPasswordButton = UIButton()
    let mobileLabel = UILabel()
    let Passwordlabel = UILabel()
    let invalidcradintalLabel = UILabel()
    let orLabel = UILabel()
    
    
    override func loadView() {
        self.view = UIView()
        self.title = "Login"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.mobileNumberTextField.delegate = self
        self.mobileNumberTextField.keyboardType = UIKeyboardType.NumberPad
        self.passwordTextField.delegate = self
        
        self.invalidcradintalLabel.backgroundColor = UIColor.whiteColor()
        self.invalidcradintalLabel.font = UIFont(name: self.invalidcradintalLabel.font.fontName, size: 12)
        self.invalidcradintalLabel.textAlignment = NSTextAlignment.Center
        self.invalidcradintalLabel.textColor = UIColor.redColor()
        self.invalidcradintalLabel.font = UIFont.boldSystemFontOfSize(12.0)
        self.view.addSubview(self.invalidcradintalLabel)

        
        self.mobileLabel.backgroundColor = UIColor.whiteColor()
        self.mobileLabel.font = UIFont(name: self.mobileLabel.font.fontName, size: 10)
        self.mobileLabel.textAlignment = NSTextAlignment.Right
        self.mobileLabel.textColor = UIColor.redColor()
        self.mobileLabel.font = UIFont.boldSystemFontOfSize(10.0)
        self.view.addSubview(self.mobileLabel)
        
        self.Passwordlabel.backgroundColor = UIColor.whiteColor()
        self.Passwordlabel.font = UIFont(name: self.Passwordlabel.font.fontName, size: 10)
        self.Passwordlabel.textAlignment = NSTextAlignment.Right
        self.Passwordlabel.textColor = UIColor.redColor()
        self.Passwordlabel.font = UIFont.boldSystemFontOfSize(10.0)
        self.view.addSubview(self.Passwordlabel)
        
        self.mobileNumberTextField.placeholder = "Mobile"
        self.passwordTextField.placeholder = "Password"
        self.passwordTextField.secureTextEntry = true
        
        self.loginButton.setTitle("Login", forState: .Normal)
        self.loginButton.addTarget(self, action: #selector(LogInViewController.onLoginButtonClicked(_:)), forControlEvents: .TouchUpInside)
        
        self.signUpButton.setTitle("Sign-up", forState: .Normal)
        self.signUpButton.addTarget(self, action: #selector(LogInViewController.onSignUpButtonClicked(_:)), forControlEvents: .TouchUpInside)
        
        self.forgotPasswordButton.backgroundColor = UIColor.whiteColor()
        self.forgotPasswordButton.setTitle("forgot passowrd?", forState: .Normal)
        self.forgotPasswordButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        self.forgotPasswordButton.titleLabel?.text = "forgot passowrd?"
        self.forgotPasswordButton.titleLabel?.font = UIFont(name: (self.forgotPasswordButton.titleLabel?.font.fontName)!, size: 12)
        self.forgotPasswordButton.addTarget(self, action: #selector(LogInViewController.onForgotPasswordButtonClicked(_:)), forControlEvents: .TouchUpInside)
        
        self.orLabel.text = "or"
        self.orLabel.font = UIFont(name: self.orLabel.font.fontName, size: 12)
        
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.mobileNumberTextField)
        self.view.addSubview(self.passwordTextField)
        self.view.addSubview(self.signUpButton)
        self.view.addSubview(self.forgotPasswordButton)
        self.view.addSubview(self.orLabel)
        
    }
    
    override func applyLayout() {
        
        self.invalidcradintalLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(90)
            make.height.equalTo(26)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.mobileNumberTextField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(150)
            make.height.equalTo(44)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.mobileLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(mobileNumberTextField.snp_bottom).offset(-16)
            make.height.equalTo(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        self.Passwordlabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(passwordTextField.snp_bottom).offset(-16)
            make.height.equalTo(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }

        

        self.passwordTextField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.mobileNumberTextField.snp_bottom).offset(10)
            make.centerX.equalTo(self.mobileNumberTextField)
            make.height.equalTo(44)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        self.Passwordlabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(passwordTextField.snp_bottom).offset(-18)
            make.height.equalTo(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.loginButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.passwordTextField.snp_bottom).offset(20)
            make.centerX.equalTo(self.view)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        
        self.forgotPasswordButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.loginButton.snp_bottom).offset(5)
            make.centerX.equalTo(self.view)
        }
        
        self.orLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.forgotPasswordButton.snp_bottom).offset(10)
            make.centerX.equalTo(self.view)
        }
        
        self.signUpButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.orLabel.snp_bottom).offset(5)
            make.centerX.equalTo(self.loginButton)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        mobileNumberTextField.addTarget(self, action: #selector(LogInViewController.mobileFunction(_:)), forControlEvents: UIControlEvents.TouchDown)
        passwordTextField.addTarget(self, action: #selector(LogInViewController.passwordFunction(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        
    }
    
    func onLoginButtonClicked(sender: UIButton!) {
        if ((self.mobileNumberTextField.text == "") && (self.passwordTextField.text == "")){
            self.mobileLabel.text = "Please Enter Your Mobile Number!"
            self.Passwordlabel.text = "Please Enter Your Password!"
        }else if (self.mobileNumberTextField.text != "" && self.passwordTextField.text! == ""){
            self.Passwordlabel.text = "Please Enter Your Password!"
        }else if(self.mobileNumberTextField.text == "" && self.passwordTextField.text! != ""){
            self.Passwordlabel.text = "Please Enter Your Mobile Number!"
        
        }else if(self.mobileNumberTextField.text?.characters.count != 10){
            self.mobileLabel.text = "Mobile Number Should Be 10 Digits! "
        }else if(Name == "failed"){
             self.invalidcradintalLabel.text = "Invalid Credential!"
        }else{
        SessionManager.sharedInstance.signInWithContactNumber(["mobileNumber": mobileNumberTextField.text!, "password": passwordTextField.text!])
        }
       
           }
    
    func mobileFunction(textField: UITextField){
        if (self.mobileNumberTextField.text == ""){
            self.mobileLabel.text = "Please Enter Your Mobile Number! "
        }
        else if(self.mobileNumberTextField.text?.characters.count != 10){
            self.mobileLabel.text = "Mobile Number Should Be 10 Degits! "
        }else if (self.passwordTextField.text != ""){
            self.Passwordlabel.text = ""
        
        }
    }
    func passwordFunction(textField: UITextField){
        if (self.mobileNumberTextField.text?.characters.count == 10 && self.mobileNumberTextField.text != "" ){
        self.mobileLabel.text = ""
        }else if (self.passwordTextField.text == ""){
           self.Passwordlabel.text = "Please Enter Your Password! "
        }
    }
    
    func onSignUpButtonClicked(sender: UIButton!) {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    func onForgotPasswordButtonClicked(sender: UIButton!) {
        print("Todo: onForgotPasswordButtonClicked")
    }
    
    // for keyboard control
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        
        return true
    }
    
  }