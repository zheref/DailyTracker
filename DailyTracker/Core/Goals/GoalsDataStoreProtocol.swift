//
//  GoalsDataStoreProtocol.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


typealias GoalsReturner = ([GoalModel]) -> Void
typealias DateReturner = (Date?) -> Void
typealias DatesReturner = ([Date]) -> Void


protocol GoalsDataStoreProtocol : DataStoreProtocol {
    
    func retrieveFirstDate(with returner: DateReturner, orFailWith thrower: ErrorThrower)
    
    func retrieveAvailableDates() -> [Date]
    
}
