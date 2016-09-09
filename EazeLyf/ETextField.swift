//
//  ETextField.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 30/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit

public class ETextField: UITextField {

    // MARK: Init
    public init() {
        super.init(frame: CGRectZero)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor(red: 181/255, green: 178/255, blue: 178/255, alpha: 1).CGColor
        self.textAlignment = NSTextAlignment.Center
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
