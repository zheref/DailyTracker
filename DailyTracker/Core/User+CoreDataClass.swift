//
//  User+CoreDataClass.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/21/16.
//  Copyright © 2016 zheref. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {

    static let entityName = "User"
    
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var goals: NSSet?
    @NSManaged public var newRelationship: User?
    @NSManaged public var newRelationship1: User?
    
}
