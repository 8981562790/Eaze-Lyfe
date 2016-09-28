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


class SignUpViewController: BaseViewController, UITextFieldDelegate {
    
    let signUpButton = ESubmitFormUIButton()
    let userNameTextField = ETextField()
    let emailTextField = ETextField()
    let contactNumberField = ETextField()
    let refCodeField = ETextField()
    let passwordTextField = ETextField()
    //
    var isValidEmail = 0
    var isValidMobileNo = 0
    
    
    var fullNameMessage = UILabel()
    var Email = UILabel()
    var passwordLabel = UILabel()
    var ContactNumberLabel = UILabel()
    var ReferralLabel = UILabel()
    var InvaliMessageLabel = UILabel()
    //
    
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Sign-up"
        
        // for textfield will be top when typed with keyboard
        
       /* NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SignUpViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SignUpViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)*/

        


        //27
        self.contactNumberField.keyboardType = UIKeyboardType.NumberPad
        self.userNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.contactNumberField.delegate = self
        self.refCodeField.delegate = self
        self.passwordTextField.delegate = self
        
        
        
        
        
        userNameTextField.addTarget(self, action: #selector(SignUpViewController.myTargetFunction(_:)), forControlEvents: UIControlEvents.TouchDown)
        emailTextField.addTarget(self, action: #selector(SignUpViewController.emailFunction(_:)), forControlEvents: UIControlEvents.TouchDown)
        passwordTextField.addTarget(self, action: #selector(SignUpViewController.PasswordFunction(_:)), forControlEvents: UIControlEvents.TouchDown)
        contactNumberField.addTarget(self, action: #selector(SignUpViewController.ContactNumberFunction(_:)), forControlEvents: UIControlEvents.TouchDown)
        refCodeField.addTarget(self, action: #selector(SignUpViewController.RefFunction(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        
        //
        
        
        self.signUpButton.setTitle("Submit", forState: .Normal)
        self.signUpButton.addTarget(self, action: #selector(SignUpViewController.onSignUpButtonClicked(_:)), forControlEvents: .TouchUpInside)
        
        self.userNameTextField.placeholder = "Name"
        self.emailTextField.placeholder = "Email"
        self.contactNumberField.placeholder = "Contact number"
        self.refCodeField.placeholder = "Referral code (Optional)"
        self.passwordTextField.placeholder = "Password"
        self.passwordTextField.secureTextEntry = true
        
        //
        self.InvaliMessageLabel.backgroundColor = UIColor.whiteColor()
        self.InvaliMessageLabel.font = UIFont(name: self.InvaliMessageLabel.font.fontName, size: 12)
        //self.fullNameMessage.text = String(" check validation ")
        self.InvaliMessageLabel.textAlignment = NSTextAlignment.Center
        self.InvaliMessageLabel.textColor = UIColor.redColor()
        self.InvaliMessageLabel.font = UIFont.boldSystemFontOfSize(12.0)
        self.view.addSubview(self.InvaliMessageLabel)
        
        self.fullNameMessage.backgroundColor = UIColor.whiteColor()
        self.fullNameMessage.font = UIFont(name: self.fullNameMessage.font.fontName, size: 10)
        //self.fullNameMessage.text = String(" check validation ")
        self.fullNameMessage.textAlignment = NSTextAlignment.Right
        self.fullNameMessage.textColor = UIColor.redColor()
        self.fullNameMessage.font = UIFont.boldSystemFontOfSize(10.0)
        self.view.addSubview(self.fullNameMessage)
        
        
        self.Email.backgroundColor = UIColor.whiteColor()
        self.Email.font = UIFont(name: self.Email.font.fontName, size: 10)
        self.Email.text = String(" ")
        self.Email.textAlignment = NSTextAlignment.Right
        self.Email.textColor = UIColor.redColor()
        self.Email.font = UIFont.boldSystemFontOfSize(10.0)
        self.view.addSubview(self.Email)
        
        self.passwordLabel.backgroundColor = UIColor.whiteColor()
        self.passwordLabel.font = UIFont(name: self.passwordLabel.font.fontName, size: 10)
        self.passwordLabel.text = String(" ")
        self.passwordLabel.textAlignment = NSTextAlignment.Right
        self.passwordLabel.textColor = UIColor.redColor()
        self.passwordLabel.font = UIFont.boldSystemFontOfSize(10.0)
        self.view.addSubview(self.passwordLabel)
        
        
        self.ContactNumberLabel.backgroundColor = UIColor.whiteColor()
        self.ContactNumberLabel.font = UIFont(name: self.ContactNumberLabel.font.fontName, size: 10)
        self.ContactNumberLabel.text = String(" ")
        self.ContactNumberLabel.textAlignment = NSTextAlignment.Right
        self.ContactNumberLabel.textColor = UIColor.redColor()
        self.ContactNumberLabel.font = UIFont.boldSystemFontOfSize(10.0)
        self.view.addSubview(self.ContactNumberLabel)
        
        self.ReferralLabel.backgroundColor = UIColor.whiteColor()
        self.ReferralLabel.font = UIFont(name: self.ReferralLabel.font.fontName, size: 10)
        self.ReferralLabel.text = String(" ")
        self.ReferralLabel.textAlignment = NSTextAlignment.Right
        self.ReferralLabel.textColor = UIColor.redColor()
        self.ReferralLabel.font = UIFont.boldSystemFontOfSize(10.0)
        self.view.addSubview(self.ReferralLabel)
        //
        self.view.addSubview(self.signUpButton)
        self.view.addSubview(self.userNameTextField)
        self.view.addSubview(self.emailTextField)
        self.view.addSubview(self.contactNumberField)
        self.view.addSubview(self.refCodeField)
        self.view.addSubview(self.passwordTextField)
    }
    // 27
    /*func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y -= keyboardSize.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height
        }
    } */

    
    func myTargetFunction(textField: UITextField) {
        if (userNameTextField.text == ""){
            self.fullNameMessage.text = "Please Enter Your Full Name !"
        }else if(userNameTextField.text != ""){
            self.fullNameMessage.text = ""
        }else{
            self.fullNameMessage.text = ""
        }
    }
    func emailFunction(textField: UITextField){
        
        
        self.fullNameMessage.text = ""
        
        if(userNameTextField.text == ""){
            self.fullNameMessage.text = "Please Enter Your Full Name !"
        }
        else if (emailTextField.text == ""){
            self.Email.text = "Please Enter Your Valid Email !"
        }
        else if isValidEmail(emailTextField.text!){
            self.Email.text = ("Valid Email")
            
        }else
        {
            self.Email.text = ("invalid Email !")
        }
        
        
    }
    
    func isValidEmail(emailTextField:String) -> Bool {
        
        print("validate emilId: \(emailTextField)")
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let result = emailTest.evaluateWithObject(emailTextField)
        
        return result
        
    }
    
    func PasswordFunction(textField: UITextField){
        
        if (emailTextField.text == ""){
            self.Email.text = "Please Enter Your Valid Email !"
        }
        else if isValidEmail(emailTextField.text!){
            self.Email.text = ("Valid Email")
            self.Email.text = ""
            
        }else if(self.passwordTextField.text == ""){
            self.passwordLabel.text = "Please Enter Your Password"
        }else if ((self.passwordTextField.text!).characters.count < 7){
            self.passwordLabel.text = "Password Should Be Minimum 7 Digit!"
        }else if ((self.passwordTextField.text!).characters.count >= 7){
            self.passwordLabel.text = " "
            
        }
        else
        {
            self.Email.text = ("invalid Email !")
            Name = ""
            
        }
        
        
        
        
    }
    
    func ContactNumberFunction(textField: UITextField){
        if isValidMobileNo(contactNumberField.text!){
            self.ContactNumberLabel.text = ("valid")
            
        }else if isValidMobileNo(contactNumberField.text!){
            
            self.ContactNumberLabel.text = ("something is wrong in your email id..please retry!")
            
        }else
        {
            //self.ContactNumberLabel.text = ("invalid")
        }
        
        
        if (self.passwordTextField.text == ""){
        self.passwordLabel.text = "Please Enter Password"
        }else if(self.passwordTextField.text != ""){
        self.passwordLabel.text = " "
        }else if(self.contactNumberField.text == ""){
        self.ContactNumberLabel.text = "Please Enter Valid Contact Number"
        }else if (self.contactNumberField.text!.characters.count <= 9){
            self.ContactNumberLabel.text = "Contact Number Should Be 10 Digit!"
        }else if (self.contactNumberField.text!.characters.count <= 10){
            self.ContactNumberLabel.text = ""
        }else{
            
        }
        
    if ((self.passwordTextField.text!).characters.count < 7){
    self.passwordLabel.text = "Password Should Be Minimum 7 Digit!"
        }
    
    }
    func RefFunction(textField: UITextField){
        self.ContactNumberLabel.text = ""
    }
    
    //
    
    
    override func applyLayout() {
        //27 - 9-16
        self.InvaliMessageLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(90)
            make.height.equalTo(28)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        
        self.fullNameMessage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(178)
            make.height.equalTo(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.Email.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.userNameTextField.snp_bottom).offset(30)
            make.height.equalTo(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.passwordLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.emailTextField.snp_bottom).offset(30)
            make.height.equalTo(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.ContactNumberLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.passwordTextField.snp_bottom).offset(30)
            make.height.equalTo(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        self.ReferralLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.contactNumberField.snp_bottom).offset(30)
            make.height.equalTo(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        
        //
        
        
        
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
        
        if (self.userNameTextField.text == "" && self.emailTextField.text == "" && self.passwordTextField.text == "" && self.contactNumberField.text == ""){
            self.fullNameMessage.text = "This field is required!"
            self.Email.text = "This field is required!"
            self.passwordLabel.text = "This field is required!"
            self.ContactNumberLabel.text = "This field is required!"
            
        }
        if(self.userNameTextField.text != "" && self.emailTextField.text == "" && self.passwordTextField.text == "" && self.contactNumberField.text == ""){
            self.fullNameMessage.text = " "
            self.Email.text = "This field is required!"
            self.passwordLabel.text = "This field is required!"
            self.ContactNumberLabel.text = "This field is required!"
            
        }
        if(self.userNameTextField.text != "" && self.emailTextField.text != "" && self.passwordTextField.text == "" && self.contactNumberField.text == ""){
            self.fullNameMessage.text = " "
            self.Email.text = " "
            self.passwordLabel.text = "This field is required!"
            self.ContactNumberLabel.text = "This field is required!"
            
        }
        if(self.userNameTextField.text != "" && self.emailTextField.text != "" && self.passwordTextField.text != "" && self.contactNumberField.text == ""){
            self.fullNameMessage.text = " "
            self.Email.text = " "
            self.passwordLabel.text = ""
            self.ContactNumberLabel.text = "This field is required!"
            
        }
        //   if isValidMobileNo(contactNumberField.text!){
         //  self.ContactNumberLabel.text = ("valid")
         //}
         else if((self.contactNumberField.text!.characters.count) != 10)
        {
            self.ContactNumberLabel.text = ("invalid")
        }
        
        
        else if ((self.passwordTextField.text!).characters.count < 7){
            
            self.passwordLabel.text = "Password Should Be Minimum 7 Charcter"
            
        }else{
            SessionManager.sharedInstance.signUpWithContactNumber(["name": userNameTextField.text!,
                "email": emailTextField.text!,
                "contactnumber": contactNumberField.text!,
                "refcode": refCodeField.text!,
                "password": passwordTextField.text!])
            
          // if (Status == 1 && Message == "Thank you for registration!") {
         // self.navigationController?.pushViewController(LogInViewController(), animated: true)
         //   }else{
        //   self.InvaliMessageLabel.text = Message
        // }
        }
        
        
       
        
    }
    func isValidMobileNo(contactNumberField:String) -> Bool {
        
         print("valid mobile no. : \(contactNumberField)")
        
        
        let PHONE_REGEX = "^\\d{10}$"
        
        let mobileTest = NSPredicate(format:"SELF MATCHES %@",PHONE_REGEX )
        
        let result1 = mobileTest.evaluateWithObject(contactNumberField)
        
        return result1
        
        
        
        
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
