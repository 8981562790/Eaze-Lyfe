//
//  MainViewController.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 01/09/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    let label = UILabel()
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setNavigationBarItem()
        self.label.text = "Main View"
        self.view.addSubview(self.label)
    }
    
    override func applyLayout() {
        self.label.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
        }
    }
    
}