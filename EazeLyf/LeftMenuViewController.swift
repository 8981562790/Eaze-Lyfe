//
//  LeftMenuViewController.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 31/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import UIKit

enum LoggedInLeftMenu: Int {
    case Orders = 0
    case Share
    case About
    case Contact
    case Logout
}

enum GuestLeftMenu: Int {
    case Login = 0
    case Orders
    case Share
    case About
    case Contact
}

protocol LeftMenuProtocol : class {
    func changeViewController(menu: LoggedInLeftMenu)
    func changeViewController(menu: GuestLeftMenu)
}

class LeftMenuViewController : BaseViewController, LeftMenuProtocol {
    
    let profileView = UIView()
    let userLabel = UILabel()
    let locationDisplayLabel = UILabel()
    let locationLabel = UILabel()
    let contactDisplayLabel = UILabel()
    let contactLabel = UILabel()
    let tableView = UITableView()
    var loggedInMenu = ["My Orders", "Share & Earn", "About us", "Contact us", "Logout"]
    var guestMenu = ["Login", "My Orders", "Share & Earn", "About us", "Contact us"]
    var mainViewController: UIViewController!
    
    override func loadView() {
        self.view = UIView()                
        self.view.backgroundColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        self.profileView.backgroundColor = UIColor.darkGrayColor()
        self.userLabel.textColor = UIColor.whiteColor()
        self.locationDisplayLabel.textColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        self.locationDisplayLabel.font = UIFont(name: self.locationDisplayLabel.font.fontName, size: 12)
        self.locationLabel.textColor = UIColor.whiteColor()
        self.locationLabel.font = UIFont(name: self.locationDisplayLabel.font.fontName, size: 12)
        self.contactDisplayLabel.textColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        self.contactDisplayLabel.font = UIFont(name: self.locationDisplayLabel.font.fontName, size: 12)
        self.contactLabel.textColor = UIColor.whiteColor()
        self.contactLabel.font = UIFont(name: self.locationDisplayLabel.font.fontName, size: 12)
        self.profileView.addSubview(self.userLabel)
        self.profileView.addSubview(self.locationDisplayLabel)
        self.profileView.addSubview(self.locationLabel)
        self.profileView.addSubview(self.contactDisplayLabel)
        self.profileView.addSubview(self.contactLabel)
        
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorStyle = .None        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(LeftMenuTableViewCell.self, forCellReuseIdentifier: "leftMenuCellIdentifier")
        self.view.addSubview(self.profileView)
        self.view.addSubview(self.tableView)
    }
    
    override func fillView() {
        let loggedInUser = SessionManager.sharedInstance.loggedInUser
        let userName = loggedInUser == nil ? "Guest" : loggedInUser?.name
        self.userLabel.text = String(format: "Welcome %@", userName!)
        self.locationDisplayLabel.text = "Current location:"
        self.locationLabel.text = loggedInUser?.location
        self.contactDisplayLabel.text = "Contact:"
        self.contactLabel.text = loggedInUser?.contactnumber
    }
    
    override func applyLayout() {
        
        self.userLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(30)
            make.centerX.equalTo(self.view)
        }
        
        self.locationDisplayLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.userLabel.snp_bottom).offset(10)
            make.centerX.equalTo(self.view).offset(-30)
        }
        
        self.locationLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.locationDisplayLabel.snp_bottom).offset(10)
            make.left.equalTo(self.locationDisplayLabel)
        }
        
        self.contactDisplayLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.userLabel.snp_bottom).offset(10)
            make.left.equalTo(self.locationDisplayLabel.snp_right).offset(20)
        }
        
        self.contactLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.contactDisplayLabel.snp_bottom).offset(10)
            make.left.equalTo(self.contactDisplayLabel)
        }
        
        self.profileView.snp_makeConstraints { (make) -> Void in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(self.view.snp_height).dividedBy(4)
            make.width.equalTo(self.view.snp_width)
        }
        
        self.tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.profileView.snp_bottom)
            make.left.right.bottom.equalTo(self.view)
            make.width.equalTo(self.view.snp_width)
        }
    }
    
    func changeViewController(menu: LoggedInLeftMenu) {
        switch menu {
        case .Orders:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .Share:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .About:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .Contact:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .Logout:
            SessionManager.sharedInstance.logout()            
        }
    }
    
    func changeViewController(menu: GuestLeftMenu) {
        switch menu {
        case .Orders:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .Share:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .About:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .Contact:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .Login:
            SessionManager.sharedInstance.logout()
        }
    }
}

extension LeftMenuViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
}

extension LeftMenuViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (SessionManager.sharedInstance.loggedInUser == nil) {
            if let menu = GuestLeftMenu(rawValue: indexPath.item) {
                switch menu {
                case .Login, .Orders, .Share, .About, .Contact:
                    let cell = LeftMenuTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "leftMenuCellIdentifier")
                    cell.textLabel?.text = guestMenu[indexPath.row]
                    return cell
                }
            }
        } else {
            if let menu = LoggedInLeftMenu(rawValue: indexPath.item) {
                let cell = LeftMenuTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "leftMenuCellIdentifier")
                cell.textLabel?.text = loggedInMenu[indexPath.row]
                switch menu {
                case .Orders:
                    let image : UIImage = UIImage(named: "ico_myorders")!
                    cell.imageView!.image = image
                    return cell
                case .Share:
                    let image : UIImage = UIImage(named: "ico_share")!
                    cell.imageView!.image = image
                    return cell
                case .About:
                    let image : UIImage = UIImage(named: "ico_aboutus")!
                    cell.imageView!.image = image
                    return cell
                case .Contact:
                    let image : UIImage = UIImage(named: "ico_contactus")!
                    cell.imageView!.image = image
                    return cell
                case .Logout:
                    let image : UIImage = UIImage(named: "ico_logout")!
                    cell.imageView!.image = image
                    return cell
                }
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.contentView.backgroundColor = UIColor(red: 225/255, green: 120/255, blue: 36/255, alpha: 1)
        if (SessionManager.sharedInstance.loggedInUser == nil) {
            if let menu = GuestLeftMenu(rawValue: indexPath.item) {
                self.changeViewController(menu)
            }
        } else {
            if let menu = LoggedInLeftMenu(rawValue: indexPath.item) {
                self.changeViewController(menu)
            }
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.contentView.backgroundColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
    }
}

extension LeftMenuViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}
