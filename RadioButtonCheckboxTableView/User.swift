//
//  User.swift
//  RadioButtonCheckboxTableView
//
//  Created by adachi.yuichi on 2015/05/07.
//  Copyright (c) 2015年 yad. All rights reserved.
//

import Foundation

enum Gender {
    case Male
    case Female
}

enum AgeLevel {
    case Over0
    case Over10
    case Over20
    case Over30
    case Over40
    case Over50
    case Over60
}

struct User {
    
    let name: String
    
    let gender: Gender
    
    let ageLevel: AgeLevel
}