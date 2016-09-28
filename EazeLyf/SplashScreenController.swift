//
//  SplashScreenController.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 18/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//


import Foundation
import UIKit
import Alamofire
import SnapKit
class SplashScreenController: BaseViewController {
    
    let imageName = "EazeLyfLogo"
    var imageView: UIImageView!
    
    let MobileLoginButton = UIButton()
    let FacebookButton = UIButton()
    let GmailButtom    = UIButton()
    let GuestLogintButton = UIButton()
    var BYProceddingLabel = UILabel()
    let TermsAndConditionButton = UIButton()
    let AndLabel = UILabel()
    let PrivacyPolicyButton = UIButton()
    
    // for underline Button Text
    var attrs = [
        NSFontAttributeName : UIFont.systemFontOfSize(12.0),
        NSForegroundColorAttributeName : UIColor.orangeColor(),
        NSUnderlineStyleAttributeName : 1]
    
    var attributedString = NSMutableAttributedString(string:"")
    
    var attrs1 = [
        NSFontAttributeName : UIFont.systemFontOfSize(12.0),
        NSForegroundColorAttributeName : UIColor.orangeColor(),
        NSUnderlineStyleAttributeName : 1]
    
    var attributedString1 = NSMutableAttributedString(string:"")
    // end underline
    
    override func loadView() {
        self.view = UIView()
        self.title = ""
        self.view.backgroundColor = UIColor.whiteColor()
        let image = UIImage(named: imageName)
        self.imageView = UIImageView(image: image!)
        // imageView.frame = CGRect(x: 160, y: 80, width: 90, height: 90)
        view.addSubview(imageView)
        
        UIView.animateWithDuration(0.7,
                                   animations: {
                                    //self.imageView.transform = CGAffineTransformMakeScale(0, 1) // this is for l to r
                                    //self.imageView.transform = CGAffineTransformMakeScale(1, 0) // this is for Sleep to Awake
                                    self.imageView.transform = CGAffineTransformMakeScale(0, 0) // Zomming
            },
                                   completion: { finish in
                                    UIView.animateWithDuration(0.7){
                                        self.imageView.transform = CGAffineTransformIdentity
                                    }
        })
        
        // end Logo Animation
        
        self.MobileLoginButton.backgroundColor = UIColor.whiteColor()
        self.MobileLoginButton.layer.borderWidth = 2;
        self.MobileLoginButton.layer.borderColor = UIColor.orangeColor().CGColor
        self.MobileLoginButton.setTitle("Mobile Login", forState: .Normal)
        self.MobileLoginButton.titleLabel?.font = UIFont(name: (self.MobileLoginButton.titleLabel?.font.fontName)!, size: 14)
        self.MobileLoginButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        self.MobileLoginButton.layer.cornerRadius = 22
        self.MobileLoginButton.addTarget(self, action: #selector(SplashScreenController.onMobileLoginButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(MobileLoginButton)
        
        // adding fb image on button
        let fbImage = UIImage(named: "fb_Image") as UIImage?
        self.FacebookButton.setImage(fbImage, forState: .Normal)
        self.FacebookButton.imageEdgeInsets = UIEdgeInsetsMake(10,-13,10,70)
        //myButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // image align
        self.FacebookButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        
        self.FacebookButton.backgroundColor = UIColor.blueColor()
        self.FacebookButton.setTitle("Connect", forState: .Normal)
        self.FacebookButton.titleLabel?.font = UIFont(name: (self.FacebookButton.titleLabel?.font.fontName)!, size: 14)
        self.FacebookButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.FacebookButton.layer.cornerRadius = 22
        self.FacebookButton.addTarget(self, action: #selector(SplashScreenController.onFacebookButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(FacebookButton)
        
        // adding Google image on button
        let G_image = UIImage(named: "g_Image") as UIImage?
        self.GmailButtom.setImage(G_image, forState: .Normal)
        self.GmailButtom.imageEdgeInsets = UIEdgeInsetsMake(0,-3,0,0)
        
        self.GmailButtom.backgroundColor = UIColor.redColor()
        self.GmailButtom.setTitle("Connect", forState: .Normal)
        self.GmailButtom.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        self.GmailButtom.titleLabel?.font = UIFont(name: (self.GmailButtom.titleLabel?.font.fontName)!, size: 14)
        self.GmailButtom.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.GmailButtom.layer.cornerRadius = 22
        self.GmailButtom.addTarget(self, action: #selector(SplashScreenController.onGmailButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(GmailButtom)
        
        self.GuestLogintButton.backgroundColor = UIColor.whiteColor()
        self.GuestLogintButton.setTitle("Guest Login ->", forState: .Normal)
        self.GuestLogintButton.titleLabel?.font = UIFont(name: (self.GuestLogintButton.titleLabel?.font.fontName)!, size: 14)
        self.GuestLogintButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.GuestLogintButton.addTarget(self, action: #selector(SplashScreenController.onGuestButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(GuestLogintButton)
        
        self.BYProceddingLabel.backgroundColor = UIColor.whiteColor()
        self.BYProceddingLabel.font = UIFont(name: self.BYProceddingLabel.font.fontName, size: 12)
        self.BYProceddingLabel.text = String("By procedding, you agree to our")
        self.BYProceddingLabel.textAlignment = NSTextAlignment.Center
        self.BYProceddingLabel.textColor = UIColor.blackColor()
        view.addSubview(BYProceddingLabel)
        
        self.TermsAndConditionButton.backgroundColor = UIColor.whiteColor()
        // for Under Line
        let buttonTitleStr = NSMutableAttributedString(string:"Terms & Conditions", attributes:attrs)
        attributedString.appendAttributedString(buttonTitleStr)
        self.TermsAndConditionButton.setAttributedTitle(attributedString, forState: .Normal)
        // end
        self.TermsAndConditionButton.addTarget(self, action: #selector(SplashScreenController.onTermsAndConditionButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(TermsAndConditionButton)
        
        self.AndLabel.backgroundColor = UIColor.whiteColor()
        self.AndLabel.font = UIFont(name: self.AndLabel.font.fontName, size: 12)
        self.AndLabel.text = String("and")
        self.AndLabel.textAlignment = NSTextAlignment.Center
        self.AndLabel.textColor = UIColor.blackColor()
        view.addSubview(AndLabel)
        
        self.PrivacyPolicyButton.backgroundColor = UIColor.whiteColor()
        // for Under Line
        let buttonTitleStr12 = NSMutableAttributedString(string:"Privcy Policy", attributes:attrs1)
        attributedString1.appendAttributedString(buttonTitleStr12)
        self.PrivacyPolicyButton.setAttributedTitle(attributedString1, forState: .Normal)
        self.PrivacyPolicyButton.addTarget(self, action: #selector(SplashScreenController.onPrivacyPolicyButtonClicked(_:)), forControlEvents: .TouchUpInside)
        // end
        view.addSubview(PrivacyPolicyButton)
        
        
        
    }
    
    override func applyLayout() {
        self.imageView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(100)
            make.top.equalTo(80)
        }
        
        self.MobileLoginButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.imageView.snp_bottom).offset(50)
            make.centerX.equalTo(self.imageView)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        self.FacebookButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.MobileLoginButton.snp_bottom).offset(12)
            make.centerX.equalTo(self.MobileLoginButton)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        
        
        self.GmailButtom.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.FacebookButton.snp_bottom).offset(5)
            make.centerX.equalTo(self.FacebookButton)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        
        self.GuestLogintButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.GmailButtom.snp_bottom).offset(5)
            make.centerX.equalTo(self.GmailButtom)
            make.height.equalTo(44)
            make.width.equalTo(150)
        }
        self.BYProceddingLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.GuestLogintButton.snp_bottom).offset(2)
            make.centerX.equalTo(self.GuestLogintButton)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        self.TermsAndConditionButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.BYProceddingLabel.snp_bottom).offset(2)
            make.centerX.equalTo(self.BYProceddingLabel)
            make.height.equalTo(15)
            make.width.equalTo(150)
        }
        self.AndLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.TermsAndConditionButton.snp_bottom).offset(2)
            make.centerX.equalTo(self.TermsAndConditionButton)
            make.height.equalTo(15)
            make.width.equalTo(150)
        }
        self.PrivacyPolicyButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.AndLabel.snp_bottom).offset(2)
            make.centerX.equalTo(self.AndLabel)
            make.height.equalTo(15)
            make.width.equalTo(150)
        }
        
        // Animation Start
        
        self.MobileLoginButton.frame = CGRectMake(0, 500, 500, 460);
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.MobileLoginButton.center = CGPointMake(self.MobileLoginButton.center.y + -500 , self.MobileLoginButton.center.x)
        })
        self.FacebookButton.frame = CGRectMake(0, 500, 500, 460);
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.FacebookButton.center = CGPointMake(self.FacebookButton.center.y + -500 , self.FacebookButton.center.x)
        })
        
        self.GmailButtom.frame = CGRectMake(0, 500, 500, 460);
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.GmailButtom.center = CGPointMake(self.GmailButtom.center.y + -500 , self.GmailButtom.center.x)
        })
        self.GuestLogintButton.frame = CGRectMake(0, 500, 500, 460);
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.GuestLogintButton.center = CGPointMake(self.GuestLogintButton.center.y + -500 , self.GuestLogintButton.center.x)
        })
        self.BYProceddingLabel.frame = CGRectMake(0, 500, 500, 460);
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.BYProceddingLabel.center = CGPointMake(self.BYProceddingLabel.center.y + -500 , self.BYProceddingLabel.center.x)
        })
        self.TermsAndConditionButton.frame = CGRectMake(0, 500, 500, 460);
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.TermsAndConditionButton.center = CGPointMake(self.TermsAndConditionButton.center.y + -500 , self.TermsAndConditionButton.center.x)
        })
        self.AndLabel.frame = CGRectMake(0, 500, 500, 460);
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.AndLabel.center = CGPointMake(self.AndLabel.center.y + -500 , self.AndLabel.center.x)
        })
        self.PrivacyPolicyButton.frame = CGRectMake(0, 500, 500, 460);
        
        UIView.animateWithDuration(2.5, animations: { () -> Void in
            self.PrivacyPolicyButton.center = CGPointMake(self.PrivacyPolicyButton.center.y + -500 , self.PrivacyPolicyButton.center.x)
        })
        
        
        // End Animation
        
        
    }
    // Redirect On Mobile Login
    
    func onMobileLoginButtonClicked(sender: UIButton!) {
        /*let controller = LogInViewController()
         let navigationController = UINavigationController()
         navigationController.navigationBar.barTintColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
         navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
         navigationController.viewControllers = [controller]
         //self.setRootVC(navigationController)*/
        //self.presentViewController(navigationController!, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(LogInViewController(), animated: true)
        
    }
    
    // Redirect On Facebook Login
    func onFacebookButtonClicked(sender: UIButton!){
        print("facbookButton Clicked")
    }
    // Redirect On Gmail Login
    func onGmailButtonClicked(sender: UIButton!){
        print("Gmail Button Clicked")
        
    }
    
    // Redirect On Guest Login
    func onGuestButtonClicked(sender: UIButton!){
        print("Guest Button Clicked")
        
    }
    // Redirect On Terms And Condition Button
    func onTermsAndConditionButtonClicked(sender: UIButton!){
        self.navigationController?.pushViewController(TermsAndConditionController(), animated: true)
    }
    
    
    
    // Redirect on Privacy Policy Controller
    
    func onPrivacyPolicyButtonClicked(sender: UIButton!){
        self.navigationController?.pushViewController(PrivacyPolicyController(), animated: true)
    }
    
    
    
}
