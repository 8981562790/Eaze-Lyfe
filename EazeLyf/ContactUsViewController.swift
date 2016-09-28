//
//  ContactUsViewController.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 28/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SnapKit

class ContactUsViewController: BaseViewController {
    let imageName = "EazeLyfLogo"
    var imageView: UIImageView!
    let WriteToUsLabel = UILabel()
    let EmailUSButton = UIButton()
    let OrLabel = UILabel()
    let CallUsButtom    = UIButton()
    var MessageLabel = UILabel()
    
    
    override func loadView() {
        self.view = UIView()
        self.title = "CONTACT US"
        self.view.backgroundColor = UIColor.whiteColor()
        self.setNavigationBarItem()
        let image = UIImage(named: imageName)
        self.imageView = UIImageView(image: image!)
        
        view.addSubview(imageView)
        
        self.WriteToUsLabel.backgroundColor = UIColor.whiteColor()
        self.WriteToUsLabel.font = UIFont(name: self.WriteToUsLabel.font.fontName, size: 12)
        self.WriteToUsLabel.text = String("Write to ")
        self.WriteToUsLabel.textAlignment = NSTextAlignment.Center
        self.WriteToUsLabel.textColor = UIColor.blackColor()
        view.addSubview(WriteToUsLabel)
        
        
        self.EmailUSButton.backgroundColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        //self.EmailUSButton.layer.borderWidth = 2;
        //self.EmailUSButton.layer.borderColor = UIColor.orangeColor().CGColor
        self.EmailUSButton.setTitle("Email Us", forState: .Normal)
        self.EmailUSButton.titleLabel?.font = UIFont(name: (self.EmailUSButton.titleLabel?.font.fontName)!, size: 14)
        self.EmailUSButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.EmailUSButton.layer.cornerRadius = 22
        self.EmailUSButton.addTarget(self, action: #selector(SplashScreenController.onMobileLoginButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(EmailUSButton)
        
        self.OrLabel.backgroundColor = UIColor.whiteColor()
        self.OrLabel.font = UIFont(name: self.OrLabel.font.fontName, size: 12)
        self.OrLabel.text = String("or")
        self.OrLabel.textAlignment = NSTextAlignment.Center
        self.OrLabel.textColor = UIColor.blackColor()
        view.addSubview(OrLabel)
        
        self.CallUsButtom.backgroundColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        self.CallUsButtom.setTitle("Call Us", forState: .Normal)
        self.CallUsButtom.titleLabel?.font = UIFont(name: (self.CallUsButtom.titleLabel?.font.fontName)!, size: 14)
        self.CallUsButtom.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.CallUsButtom.layer.cornerRadius = 22
        self.CallUsButtom.addTarget(self, action: #selector(SplashScreenController.onGmailButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(CallUsButtom)
        
        self.MessageLabel.backgroundColor = UIColor.whiteColor()
        self.MessageLabel.font = UIFont(name: self.MessageLabel.font.fontName, size: 12)
        self.MessageLabel.text = String("We would be happy to answer all your questions.")
        self.MessageLabel.textAlignment = NSTextAlignment.Center
        self.MessageLabel.textColor = UIColor.blackColor()
        self.MessageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.MessageLabel.numberOfLines = 2
        view.addSubview(MessageLabel)
        
        
    }
    
    override func applyLayout() {
        self.imageView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(100)
            make.top.equalTo(80)
        }
        self.WriteToUsLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.imageView.snp_bottom).offset(25)
            make.centerX.equalTo(self.imageView)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        
        self.EmailUSButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.WriteToUsLabel.snp_bottom).offset(5)
            make.centerX.equalTo(self.WriteToUsLabel)
            make.height.equalTo(44)
            make.width.equalTo(270)
        }
        self.OrLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.EmailUSButton.snp_bottom).offset(10)
            make.centerX.equalTo(self.EmailUSButton)
            make.height.equalTo(20)
            make.width.equalTo(150)
        }
        
        self.CallUsButtom.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.OrLabel.snp_bottom).offset(5)
            make.centerX.equalTo(self.OrLabel)
            make.height.equalTo(44)
            make.width.equalTo(270)
        }
        
        self.MessageLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.CallUsButtom.snp_bottom).offset(50)
            make.centerX.equalTo(self.CallUsButtom)
            make.height.equalTo(80)
            make.width.equalTo(200)
        }
    }
    
    
}
