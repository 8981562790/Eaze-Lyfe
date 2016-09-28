//
//  DealsViewController.swift
//  EazeLyf
//
//  Created by Appsquad Pvt. Ltd. on 28/09/16.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import SMSegmentView

class DealsViewController: BaseViewController {
    var segmentedControl: SMSegmentView!
    var cuisineCollectionView: UICollectionView!
    var items = ["Bengali Specials (Regular NV)", "Bengali Veg Regular", "Bengali Non Veg Regular"]
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let baseColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        self.segmentedControl = SMSegmentView(frame: CGRectZero, separatorColour: baseColor, separatorWidth: 1.0, segmentProperties: ["OnSelectionBackgroundColour":baseColor])
        self.segmentedControl.addSegmentWithTitle("Lunch", onSelectionImage: nil, offSelectionImage: nil)
        self.segmentedControl.addSegmentWithTitle("Dinner", onSelectionImage: nil, offSelectionImage: nil)
        self.segmentedControl.selectSegmentAtIndex(0)
        self.segmentedControl.layer.borderColor = UIColor(white: 0.9, alpha: 1.0).CGColor
        self.segmentedControl.layer.borderWidth = 1.0
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.scrollDirection = .Horizontal
        
        self.cuisineCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        self.cuisineCollectionView.backgroundColor = UIColor.clearColor()
        self.cuisineCollectionView.delegate = self
        self.cuisineCollectionView.dataSource = self
        self.cuisineCollectionView.showsHorizontalScrollIndicator = false
        self.cuisineCollectionView.registerClass(DealsCuisineCollectionViewCell.self, forCellWithReuseIdentifier: "cuisineLabel")
        
        self.view.addSubview(self.segmentedControl)
        self.view.addSubview(self.cuisineCollectionView)
    }
    
    override func applyLayout() {
        self.segmentedControl.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(70)
            make.height.equalTo(44)
            make.left.equalTo(self.view).offset(-1)
            make.right.equalTo(self.view).offset(1)
            make.centerX.equalTo(self.view)
        }
        
        self.cuisineCollectionView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.segmentedControl.snp_bottom)
            make.height.equalTo(44)
            make.left.right.equalTo(self.view)
            make.width.equalTo(self.view)
        }
    }
}

extension DealsViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
}

extension DealsViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cuisineLabel", forIndexPath: indexPath) as! DealsCuisineCollectionViewCell
        cell.cellLabel.text = self.items[indexPath.item]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(150, 33)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10)
    }
}