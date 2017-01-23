//
//  Asset+CoreDataClass.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/21/16.
//  Copyright © 2016 zheref. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Asset)
public class Asset: NSManagedObject {
    
    static let entityName = "Asset"
    
    
    @NSManaged public var adventure: NSNumber?
    @NSManaged public var brand: String?
    @NSManaged public var buydate: NSDate?
    @NSManaged public var category: String?
    @NSManaged public var crosscountry: NSNumber?
    @NSManaged public var duration: NSNumber?
    @NSManaged public var environment: String?
    @NSManaged public var kind: String?
    @NSManaged public var paidprice: NSDecimalNumber?
    @NSManaged public var picture: NSData?
    @NSManaged public var placestuck: NSNumber?
    @NSManaged public var renewprice: NSDecimalNumber?
    @NSManaged public var savingtime: NSNumber?
    @NSManaged public var whimpoints: Earning?
    
}
