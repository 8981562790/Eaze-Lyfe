//
//  LeftMenuTableViewCell.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 31/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import UIKit
import SnapKit

class LeftMenuTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        self.textLabel?.textColor = UIColor.whiteColor()
        self.textLabel?.font = UIFont(name: self.textLabel!.font.fontName, size: 14)
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRectMake(5, 5, 33, 33)
    }
}