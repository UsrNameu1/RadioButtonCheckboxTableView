//
//  UserListTableViewController.swift
//  RadioButtonCheckboxTableView
//
//  Created by adachi.yuichi on 2015/05/07.
//  Copyright (c) 2015年 yad. All rights reserved.
//

import UIKit

class UserListTableViewController: UITableViewController {
    
    private let CellIdentifier = "CellIdentifier"
    private let SegueIdentifier = "AddUserTableViewController"
    
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segue.identifier ?? ""
        switch identifier {
        case SegueIdentifier :
            let addViewController = segue.destinationViewController as! UserAddTableViewController
            addViewController.delegate = self
        default : ()
        }
    }

}

extension UserListTableViewController: UITableViewDataSource {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        let index = indexPath.row
        cell.textLabel?.text = users[index].name
        cell.detailTextLabel?.text = users[index].ageLevel.levelText
        let backgroundColor: UIColor
        switch users[index].gender {
        case .Male : backgroundColor = UIColor.cyanColor()
        case .Female : backgroundColor = UIColor.magentaColor()
        }
        cell.backgroundColor = backgroundColor
        return cell
    }
}

extension UserListTableViewController: UserAddTableViewControllerDelegate {
    func userAddViewController(vc: UserAddTableViewController, doneButtonDidTapWithUser user: User) {
        users.append(user)
        tableView.reloadData()
    }
}

extension AgeLevel {
    var levelText: String {
        let headString = "Age between "
        switch self {
        case .Over0 : return headString + "0 - 10"
        case .Over10 : return headString + "10 - 20"
        case .Over20 : return headString + "20 - 30"
        case .Over30 : return headString + "30 - 40"
        case .Over40 : return headString + "40 - 50"
        case .Over50 : return headString + "50 - 60"
        case .Over60 : return headString + "60 - "
        }
    }
}