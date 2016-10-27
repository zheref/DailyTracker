//
//  GoalEntity.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


class GoalModel : ModelProtocol {
    
    init() {}
    
    init(with goal: Goal) {
        creationDate = goal.creationDate
        expiringDate = goal.expiringDate
        lastUpdateDate = goal.lastUpdateDate
        reminder = goal.reminder
        remindPattern = goal.remindPattern
        `repeat` = goal.repeat
        text = goal.text
        
        category = goal.category
        children = goal.children
        parent = goal.parent
        user = goal.user
        records = goal.records
    }
    
    
    var creationDate: NSDate?
    var expiringDate: NSDate?
    var lastUpdateDate: NSDate?
    var reminder: NSDate?
    var remindPattern: String?
    var `repeat`: NSNumber?
    var text: String?
    
    var category: Category?
    var children: NSSet?
    var parent: Goal?
    var user: User?
    var records: NSSet?
    
}
