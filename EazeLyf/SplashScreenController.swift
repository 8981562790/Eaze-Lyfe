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
    
       let imageName = "ico_myorders"
    var imageView: UIImageView!
    
       let MobileLoginButton = UIButton()
       let FacebookButton = UIButton()
       let GmailButtom    = UIButton()
       let GuestLogintButton = UIButton()
       let BYProceddingLabel = UILabel()
       let TermsAndConditionButton = UIButton()
       let AndLabel = UILabel()
       let PrivacyPolicyButton = UIButton()
    
    override func loadView() {
        self.view = UIView()
        self.title = "Login"
        self.view.backgroundColor = UIColor.whiteColor()
        
 
        let image = UIImage(named: imageName)
         self.imageView = UIImageView(image: image!)
       // imageView.frame = CGRect(x: 160, y: 80, width: 90, height: 90)
        view.addSubview(imageView)
        
        
        
        // for logo
        
        UIView.animateWithDuration(0.6 ,
        animations: {
        self.imageView.transform = CGAffineTransformMakeScale(0.6, 0.6)
            },
        completion: { finish in
        UIView.animateWithDuration(0.6){
        self.imageView.transform = CGAffineTransformIdentity
            }
        })
        
        // zooming image only
        
        
        /*UIView.animateWithDuration(0.7 ,
        animations: {
        self.EazeLyfImage.transform = CGAffineTransformMakeScale(0, 0)
            },
        completion: { finish in
        UIView.animateWithDuration(0.7){
        self.EazeLyfImage.transform = CGAffineTransformIdentity
            }
        })*/
        
        
        // end logo


    }
    
    override func applyLayout() {
        self.imageView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.height.width.equalTo(90)
            make.top.equalTo(160)
            
        }
        
        
        
        
    }
    

}
