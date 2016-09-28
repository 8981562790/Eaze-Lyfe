//
//  MenusViewController.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 06/09/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SnapKit

enum MenusHeaderSection: Int {
    case Today = 0
    case Tomorrow
    case Party
}

//Todo: This needs to be done with API
enum MenusOptions: Int {
    case Bengali = 0
    case NI
    case All
}

class MenusViewController: BaseViewController {
    
    struct Section {
        var name: String!
        var items: [String]!
        var collapsed: Bool!
        
        init(name: String, items: [String], collapsed: Bool = false) {
            self.name = name
            self.items = items
            self.collapsed = collapsed
        }
    }
    
    var sections = [Section]()
    let tableView = UITableView()
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.setNavigationBarItem()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        self.tableView.registerClass(MenusTableViewHeaderCell.self, forCellReuseIdentifier: "menuHeader")
        self.tableView.separatorInset = UIEdgeInsetsMake(5, 0, 0, 0)
        self.view.addSubview(self.tableView)
        
        //Todo: get menu items from API
        sections = [
            Section(name: "Today's Menu", items: ["Bengali", "North Indian", "All"]),
            Section(name: "Tomorrow's Menu", items: ["Bengali", "North Indian", "All"]),
            Section(name: "Party Order", items: [])
        ]
    }
    
    override func applyLayout() {
        self.tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(5.0)
            make.bottom.equalTo(self.view)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view.snp_width).inset(5.0)
        }
    }
    
    func onToggleButtonClicked(sender: UIButton!) {
        let collapsed = sections[sender.tag].collapsed
        
        // Toggle collapse
        sections[sender.tag].collapsed = !collapsed
        
        // Reload section
        self.tableView.reloadSections(NSIndexSet(index: sender.tag), withRowAnimation: .Automatic)
    }
}

extension MenusViewController : UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCellWithIdentifier("menuHeader") as! MenusTableViewHeaderCell
        if let menu = MenusHeaderSection(rawValue: section) {
            switch menu {
            case .Today:
                header.menuImageView = UIImageView(image: UIImage(named: "cell_today_menu"))
                break
            case .Tomorrow:
                header.menuImageView = UIImageView(image: UIImage(named: "cell_tomorrow_menu"))
                break
            case .Party:
                header.menuImageView = UIImageView(image: UIImage(named: "cell_party_menu"))
                break
            }
        }
        
        //        header.toggleButton.tag = section
        //        header.titleLabel.text = sections[section].name
        //        header.toggleButton.rotate(sections[section].collapsed! ? 0.0 : CGFloat(M_PI_2))
        header.toggleButton.tag = section
        header.layoutSubviews()
        return header.contentView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
}

extension MenusViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sections[section].collapsed!) ? 0 : sections[section].items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = MenuTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "menuCell")
        if let menu = MenusOptions(rawValue: indexPath.item) {
            cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
            switch menu {
            case .Bengali:
                let image : UIImage = UIImage(named: "ico_beng_cuisine")!
                cell.imageView!.image = image
                break
            case .NI:
                let image : UIImage = UIImage(named: "ico_ni_cuisine")!
                cell.imageView!.image = image
                break
            case .All:
                let image : UIImage = UIImage(named: "ico_all_cuisine")!
                cell.imageView!.image = image
                break
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.contentView.backgroundColor = UIColor.whiteColor()
        self.navigationController?.pushViewController(DealsViewController(), animated: true)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

extension MenusViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}