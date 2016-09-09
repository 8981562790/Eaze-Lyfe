//
//  ESubmitFormUIButton.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 31/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit

public class ESubmitFormUIButton: UIButton {
    
    // MARK: Init
    public init() {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)        
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}