//
//  Earning+CoreDataProperties.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/21/16.
//  Copyright © 2016 zheref. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Earning {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Earning> {
        return NSFetchRequest<Earning>(entityName: "Earning");
    }

    @NSManaged public var points: NSNumber?
    @NSManaged public var date: NSDate?
    @NSManaged public var spend: Asset?

}
