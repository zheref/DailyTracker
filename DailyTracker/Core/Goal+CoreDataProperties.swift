//
//  Goal+CoreDataProperties.swift
//  
//
//  Created by Sergio Daniel Lozano on 11/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal");
    }

    @NSManaged public var creationDate: NSDate?
    @NSManaged public var expiringDate: NSDate?
    @NSManaged public var lastUpdateDate: NSDate?
    @NSManaged public var reminder: NSDate?
    @NSManaged public var remindPattern: String?
    @NSManaged public var repetitions: NSNumber?
    @NSManaged public var text: String?
    @NSManaged public var points: NSNumber?
    @NSManaged public var category: Category?
    @NSManaged public var children: NSSet?
    @NSManaged public var parent: Goal?
    @NSManaged public var records: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for children
extension Goal {

    @objc(addChildrenObject:)
    @NSManaged public func addToChildren(_ value: Goal)

    @objc(removeChildrenObject:)
    @NSManaged public func removeFromChildren(_ value: Goal)

    @objc(addChildren:)
    @NSManaged public func addToChildren(_ values: NSSet)

    @objc(removeChildren:)
    @NSManaged public func removeFromChildren(_ values: NSSet)

}

// MARK: Generated accessors for records
extension Goal {

    @objc(addRecordsObject:)
    @NSManaged public func addToRecords(_ value: Record)

    @objc(removeRecordsObject:)
    @NSManaged public func removeFromRecords(_ value: Record)

    @objc(addRecords:)
    @NSManaged public func addToRecords(_ values: NSSet)

    @objc(removeRecords:)
    @NSManaged public func removeFromRecords(_ values: NSSet)

}
