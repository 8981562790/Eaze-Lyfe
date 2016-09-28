//
//  PrivacyPolicyController.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 19/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import UIKit

class PrivacyPolicyController: BaseViewController {
    
    let PrivacyPolicyView = UITextView()
    
    override func loadView() {
        self.view = UIView()
        self.title = "PRIVACY POLICY"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()]  // FOR TITLE COLOR
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Arial", size: 12.0)!] // FOR FONT SIZE
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor() // FOR ARROW COLOR
        self.view.backgroundColor = UIColor.whiteColor()
        self.PrivacyPolicyView.text = "This policy explains how we, Eazelyf a brand of http://www.eazelyf.com, use your personal information which you provide to us when using our service, including but not limited to our website.\n \nWhat information we collect about you?\n \nWe collect personal information from you when you order goods or services from us or use our website. We also collect information when you complete any customer survey. Website usage information may also be collected using cookies.\n \nHow will we use the information we collect from you?\n \nInformation that we collect from you is used to process your order and to manage your account. We may also use your information to email you about other products or services that we think may be of interest to you.\n \nIn processing your order we may send your information to credit reference and fraud prevention agencies.\n \nFrom time to time we may send your information to third parties which we consider may have goods or services which are of interest to you. If you do not wish to be contacted by third parties please email us at care@Eazelyf.com\n \nAccess to your information\n \nYou have a right to request a copy of the information we hold on you at any time. Please email us if you would like to receive a copy of this information ñ care@Eazelyf.com. There will be a small charge for processing this request.\n \nOther Websites\n \nOur website may have links to other websites. This privacy policy only applies to this website. You should therefore read the privacy policies of the other websites when you are using those sites."
        self.PrivacyPolicyView.editable = false
        self.PrivacyPolicyView.backgroundColor = UIColor.whiteColor()
        self.PrivacyPolicyView.font = UIFont.systemFontOfSize(12)
        view.addSubview(PrivacyPolicyView)
        
        
    }
    
    override func applyLayout() {
        
        self.PrivacyPolicyView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(10)
            make.height.equalTo(540)
            make.left.equalTo(self.view).offset(15)
            make.right.equalTo(self.view).offset(-15)
        }
        
    }
    
}
