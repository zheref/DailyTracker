//
//  Earning+CoreDataClass.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/21/16.
//  Copyright © 2016 zheref. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Earning)
public class Earning: NSManagedObject {

    @NSManaged public var date: NSDate?
    @NSManaged public var points: NSNumber?
    @NSManaged public var spend: Asset?
    
}
