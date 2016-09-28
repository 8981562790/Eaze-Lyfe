//
//  ShareAndEarnController.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 28/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SnapKit

class ShareAndEarnController: BaseViewController {
    let imageName = "shareAndEarnIcon"
    var imageView: UIImageView!
    let RewardLabel = UILabel()
    let MyBalanceLabel = UILabel()
    var RsLabel = UILabel()
    let PromoCodeLabel = UILabel()
    let InviteButtom    = UIButton()
    
    
    
    
    override func loadView() {
        self.view = UIView()
        self.title = "CONTACT US"
        self.setNavigationBarItem()
        self.view.backgroundColor = UIColor.whiteColor()
        let image = UIImage(named: imageName)
        self.imageView = UIImageView(image: image!)
        
        view.addSubview(imageView)
        
        self.RewardLabel.backgroundColor = UIColor.whiteColor()
        self.RewardLabel.font = UIFont(name: self.RewardLabel.font.fontName, size: 12)
        self.RewardLabel.text = String("You will get Rs.50 when your friends order and they gets Rs.50 when they signup ")
        self.RewardLabel.textAlignment = NSTextAlignment.Center
        self.RewardLabel.textColor = UIColor.grayColor()
        self.RewardLabel.numberOfLines = 2
        view.addSubview(RewardLabel)
        
        
        self.MyBalanceLabel.backgroundColor = UIColor.whiteColor()
        self.MyBalanceLabel.font = UIFont(name: "CalibriR", size: 12)
        self.MyBalanceLabel.text = String("My Balance Rs. ")
        self.MyBalanceLabel.textAlignment = NSTextAlignment.Right
        self.MyBalanceLabel.textColor = UIColor.grayColor()
        self.MyBalanceLabel.font = UIFont.boldSystemFontOfSize(12.0)
        
        view.addSubview(MyBalanceLabel)
        
        self.RsLabel.backgroundColor = UIColor.whiteColor()
        self.RsLabel.font = UIFont(name: self.RsLabel.font.fontName, size: 12)
        self.RsLabel.text = String(" 0 ")
        self.RsLabel.textAlignment = NSTextAlignment.Left
        self.RsLabel.textColor = UIColor.grayColor()
        self.RsLabel.font = UIFont.boldSystemFontOfSize(12.0)
        view.addSubview(RsLabel)
        
        self.PromoCodeLabel.backgroundColor = UIColor.whiteColor()
        self.PromoCodeLabel.font = UIFont(name: "Calibri", size: 16)
        self.PromoCodeLabel.layer.cornerRadius = 13
        self.PromoCodeLabel.layer.borderWidth = 2
        self.PromoCodeLabel.layer.borderColor = UIColor.orangeColor().CGColor
        self.PromoCodeLabel.text = String("PROMOCODE001")
        self.PromoCodeLabel.textAlignment = NSTextAlignment.Center
        self.PromoCodeLabel.textColor = UIColor.grayColor()
        //self.PromoCodeLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        view.addSubview(PromoCodeLabel)
        
        self.InviteButtom.backgroundColor = UIColor.whiteColor()
        self.InviteButtom.setTitle("INVITE", forState: .Normal)
        self.InviteButtom.titleLabel?.font = UIFont(name: (self.InviteButtom.titleLabel?.font.fontName)!, size: 14)
        self.InviteButtom.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.InviteButtom.addTarget(self, action: #selector(ShareAndEarnController.onInviteButtonClicked(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(InviteButtom)
        
        
    }
    
    override func applyLayout() {
        self.imageView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.height.equalTo(350)
            make.width.equalTo(270)
            make.top.equalTo(70)
        }
        self.RewardLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.imageView.snp_bottom).offset(5)
            make.centerX.equalTo(self.imageView)
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
        
        self.MyBalanceLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.RewardLabel.snp_bottom).offset(5)
            make.left.equalTo(self.RewardLabel)
            make.height.equalTo(20)
            make.width.equalTo(150)
        }
        
        self.RsLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.RewardLabel.snp_bottom).offset(5)
            make.right.equalTo(self.RewardLabel)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        
        self.PromoCodeLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.RewardLabel.snp_bottom).offset(35)
            make.centerX.equalTo(self.RewardLabel)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
        self.InviteButtom.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.PromoCodeLabel.snp_bottom).offset(5)
            make.centerX.equalTo(self.PromoCodeLabel)
            make.height.equalTo(20)
            make.width.equalTo(70)
        }
        
    }
    
    func onInviteButtonClicked(sender: UIButton!){
        print("Invite Button Clicked")
    }
    
    
}
