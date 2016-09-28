//
//  MenuTableViewCell.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 28/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit

class MenuTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.whiteColor()
        self.textLabel?.textColor = UIColor.darkGrayColor()
        self.textLabel?.font = UIFont(name: self.textLabel!.font.fontName, size: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRectMake(5, 5, 33, 33)
    }
}