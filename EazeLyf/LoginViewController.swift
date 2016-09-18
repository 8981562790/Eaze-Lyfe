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

class LogInViewController: BaseViewController {
    
    let loginButton = ESubmitFormUIButton()
    let signUpButton = ESubmitFormUIButton()
    let mobileNumberTextField = ETextField()
    let passwordTextField = ETextField()
    let forgotPasswordButton = UIButton()
    let orLabel = UILabel()
    // Rehan 
    let SplashScreenButton = UIButton()
    
    // end
    
    override func loadView() {
        self.view = UIView()
        self.title = "Login"
        self.view.backgroundColor = UIColor.whiteColor()
        
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
        // Rehan 
        self.SplashScreenButton.backgroundColor = UIColor.blackColor()
        self.SplashScreenButton.setTitle("First Screen", forState: .Normal)
        self.SplashScreenButton.addTarget(self, action: #selector(LogInViewController.onSplashScreenButtonClicked(_:)), forControlEvents: .TouchUpInside)
        
        //End
        
        
        
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.mobileNumberTextField)
        self.view.addSubview(self.passwordTextField)
        self.view.addSubview(self.signUpButton)
        self.view.addSubview(self.forgotPasswordButton)
        self.view.addSubview(self.orLabel)
        
        //Rehan
        self.view.addSubview(self.SplashScreenButton)
        //end
    }
    
    override func applyLayout() {
        self.mobileNumberTextField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(150)
            make.height.equalTo(44)
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
        //Rehan
        self.SplashScreenButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.signUpButton.snp_bottom).offset(10)
            make.centerX.equalTo(self.loginButton)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        
        //end
        
    }
    
    func onLoginButtonClicked(sender: UIButton!) {        
        SessionManager.sharedInstance.signInWithContactNumber(["mobileNumber": mobileNumberTextField.text!, "password": passwordTextField.text!])
        // rehan (start validation! )
        if (mobileNumberTextField.text == ""){
            let alert = UIAlertController(title: "Nil!", message: "Enter Your Mobile Numbar!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) in print("")
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        if (passwordTextField.text == "" ){
            let alert = UIAlertController(title: "Nil!", message: "Enter Your Password!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) in print("")
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        
        }
        // end validation!
        
    }
    
    func onSignUpButtonClicked(sender: UIButton!) {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    func onForgotPasswordButtonClicked(sender: UIButton!) {
        print("Todo: onForgotPasswordButtonClicked")
    }
    
    //Rehan
    func onSplashScreenButtonClicked(sender: UIButton){
    self.navigationController?.pushViewController(SplashScreenController(), animated: true)
    }
    //end
}