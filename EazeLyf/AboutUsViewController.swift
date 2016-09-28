//
//  AboutUsViewController.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 28/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import UIKit

class AboutUsViewController: BaseViewController {
    
    let AboutTextView = UITextView()
    override func loadView() {
        self.view = UIView()
        self.title = "ABOUT US"
        self.setNavigationBarItem()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        self.AboutTextView.text = "Our in- house delivery team and logistic partner will deliver the food to customers using a completely automated & technology oriented delivery mechanism. "
        //self.AboutTextView.font = UIFont.boldSystemFontOfSize(26)
        //self.AboutTextView.textAlignment = NSTextAlignment.Center
        self.AboutTextView.editable = false
        self.AboutTextView.backgroundColor = UIColor.whiteColor()
        self.AboutTextView.font = UIFont.systemFontOfSize(12)
        view.addSubview(AboutTextView)
        
        
        
    }
    override func applyLayout() {
        
        
        self.AboutTextView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(8)
            make.height.equalTo(540)
            make.left.equalTo(self.view).offset(15)
            make.right.equalTo(self.view).offset(-15)
        }
        
    }
    
}
