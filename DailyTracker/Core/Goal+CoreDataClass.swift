//
//  Goal+CoreDataClass.swift
//  
//
//  Created by Sergio Daniel Lozano on 11/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Goal)
public class Goal: NSManagedObject {
    
    static let entityName = "Goal"
    
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var expiringDate: NSDate?
    @NSManaged public var lastUpdateDate: NSDate?
    @NSManaged public var points: NSNumber?
    @NSManaged public var reminder: NSDate?
    @NSManaged public var remindPattern: String?
    @NSManaged public var repetitions: NSNumber?
    @NSManaged public var text: String?
    @NSManaged public var category: Category?
    @NSManaged public var children: NSSet?
    @NSManaged public var parent: Goal?
    @NSManaged public var records: NSSet?
    @NSManaged public var user: User?
    
}
