//
//  MenusTableViewHeaderCell.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 28/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit

class MenusTableViewHeaderCell: UITableViewCell {
    
    var menuImageView: UIImageView?
    let toggleButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.userInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.toggleButton.backgroundColor = UIColor.clearColor()
        self.toggleButton.addTarget(self, action: #selector(MenusViewController.onToggleButtonClicked(_:)), forControlEvents: .TouchUpInside)
        
        self.contentView.addSubview(self.menuImageView!)
        self.contentView.addSubview(self.toggleButton)
        self.menuImageView!.snp_makeConstraints { (make) -> Void in
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView)
            make.right.equalTo(self.contentView)
        }
        
        self.toggleButton.snp_makeConstraints { (make) -> Void in
            make.top.bottom.left.right.equalTo(self.contentView)
        }
        
        
}
}
