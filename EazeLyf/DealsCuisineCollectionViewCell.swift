//
//  DealsCuisineCollectionViewCell.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 28/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import SnapKit

class DealsCuisineCollectionViewCell: UICollectionViewCell {
    
    let cellLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellLabel.font = UIFont(name: self.cellLabel.font.fontName, size: 12)
        self.cellLabel.textColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.addSubview(self.cellLabel)
        
        self.cellLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.contentView)
            make.centerY.equalTo(self.contentView)
        }
    }
}
