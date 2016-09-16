//
//  SignUpViewController.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 29/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SnapKit

class SignUpViewController: BaseViewController {
    
    let signUpButton = ESubmitFormUIButton()
    let userNameTextField = ETextField()
    let emailTextField = ETextField()
    let contactNumberField = ETextField()
    let refCodeField = ETextField()
    let passwordTextField = ETextField()
    
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Sign-up"
        
        self.signUpButton.setTitle("Submit", forState: .Normal)        
        self.signUpButton.addTarget(self, action: #selector(SignUpViewController.onSignUpButtonClicked(_:)), forControlEvents: .TouchUpInside)
        
        self.userNameTextField.placeholder = "Name"
        self.emailTextField.placeholder = "Email"
        self.contactNumberField.placeholder = "Contact number"
        self.refCodeField.placeholder = "Referral code"
        self.passwordTextField.placeholder = "Password"
        self.passwordTextField.secureTextEntry = true
        self.view.addSubview(self.signUpButton)
        self.view.addSubview(self.userNameTextField)
        self.view.addSubview(self.emailTextField)
        self.view.addSubview(self.contactNumberField)
        self.view.addSubview(self.refCodeField)
        self.view.addSubview(self.passwordTextField)
    }
    
    override func applyLayout() {
        self.userNameTextField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(150)
            make.height.equalTo(44)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.emailTextField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.userNameTextField.snp_bottom).offset(5)
            make.height.equalTo(44)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.passwordTextField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.emailTextField.snp_bottom).offset(5)
            make.height.equalTo(44)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.contactNumberField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.passwordTextField.snp_bottom).offset(5)
            make.height.equalTo(44)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.refCodeField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.contactNumberField.snp_bottom).offset(5)
            make.height.equalTo(44)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.signUpButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.refCodeField.snp_bottom).offset(15)
            make.centerX.equalTo(self.view)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
    }
    
    func onSignUpButtonClicked(sender: UIButton!) {
        
        // Rehan (start validation!)
        
        if (userNameTextField.text == "" && emailTextField.text == "" && passwordTextField.text == "" && contactNumberField.text == "" && refCodeField.text == "" ){
            let alert = UIAlertController(title: "Blank Data!", message: "All Fields Are Required !", preferredStyle: UIAlertControllerStyle.Alert)
            //alert.addAction(UIAlertAction(title: "", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) in print("")
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        
        }else if (emailTextField.text == "") {
            let alert = UIAlertController(title: "Blank Data!", message: "Enter Your Email Please!", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) in print("")
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        
        }else if (passwordTextField.text == ""){
            let alert = UIAlertController(title: "Blank Data!", message: "Enter Your password !", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) in print("")
            }))
            self.presentViewController(alert, animated: true, completion: nil)

        
        }else if (contactNumberField.text == ""){
            let alert = UIAlertController(title: "Blank Data!", message: "Enter Your Contact Number !", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(action:UIAlertAction!) in print("")
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        }
        // end validation!
        
        else {
            SessionManager.sharedInstance.signUpWithContactNumber(["name": userNameTextField.text!,
                "email": emailTextField.text!,
                "contactnumber": contactNumberField.text!,
                "refcode": refCodeField.text!,
                "password": passwordTextField.text!])

        
        }
    }
}
