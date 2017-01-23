//
//  Record+CoreDataClass.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/21/16.
//  Copyright © 2016 zheref. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Record)
public class Record: NSManagedObject {

    @NSManaged public var datetime: NSDate?
    @NSManaged public var goal: Goal?
    
}
