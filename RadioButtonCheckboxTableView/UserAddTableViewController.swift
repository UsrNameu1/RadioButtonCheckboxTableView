//
//  UserAddTableViewController.swift
//  RadioButtonCheckboxTableView
//
//  Created by adachi.yuichi on 2015/05/07.
//  Copyright (c) 2015年 yad. All rights reserved.
//

import UIKit

protocol UserAddTableViewControllerDelegate: class {
    func userAddViewController(
        vc: UserAddTableViewController,
        doneButtonDidTapWithUser user: User
    )
}

class UserAddTableViewController: UITableViewController {
    
    weak var delegate: UserAddTableViewControllerDelegate?
    
    private var selectedLevel: AgeLevel = .Over0
    @IBOutlet weak var nameTextField: UITextField!
    private var selectedGender: Gender = .Male

    @IBOutlet var ageCells: [UITableViewCell]!
    
    @IBOutlet var genderCells: [UITableViewCell]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonDidTap(sender: AnyObject) {
        let user =
        User(name: nameTextField.text ?? "",
            gender: selectedGender,
            ageLevel: selectedLevel
        )
        delegate?.userAddViewController(self, doneButtonDidTapWithUser: user)
        navigationController?.popViewControllerAnimated(true)
    }
}

extension UserAddTableViewController: UITableViewDelegate {
    
    override func tableView(
        tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
            where contains(ageCells, selectedCell) {
            ageCells.map { cell in
                cell.accessoryType = .None
            }
            selectedCell.accessoryType = .Checkmark
        }
        
        if let level = AgeLevel(cellIndexPath: indexPath) {
            selectedLevel = level
        }
        
        if let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
            where contains(genderCells, selectedCell) {
            genderCells.map { cell in
                cell.accessoryType = .None
            }
            selectedCell.accessoryType = .Checkmark
        }
        
        if let gender = Gender(cellIndexPath: indexPath) {
            selectedGender = gender
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

extension AgeLevel {
    init?(cellIndexPath: NSIndexPath) {
        switch (cellIndexPath.row, cellIndexPath.section) {
        case (0, 0) : self = .Over0
        case (1, 0) : self = .Over10
        case (2, 0) : self = .Over20
        case (3, 0) : self = .Over30
        case (4, 0) : self = .Over40
        case (5, 0) : self = .Over50
        case (6, 0) : self = .Over60
        default : return nil
        }
    }
}

extension Gender {
    init?(cellIndexPath: NSIndexPath) {
        switch (cellIndexPath.row, cellIndexPath.section) {
        case (0, 2) : self = .Male
        case (1, 2) : self = .Female
        default : return nil
        }
    }
}

extension UserAddTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
