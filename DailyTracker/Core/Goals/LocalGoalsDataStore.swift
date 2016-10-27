//
//  LocalGoalsDataStore.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


class LocalGoalsDataStore : GoalsDataStoreProtocol {
    
    
    static var shared: LocalGoalsDataStore = {
        return LocalGoalsDataStore()
    }()
    
    
    private init() {}
    
    
    func retrieveAll(with returner: GoalsReturner, orFailWith thrower: Thrower) {
        
    }
    
    
    func retrieveFirstDate(with returner: DateReturner, orFailWith thrower: ErrorThrower) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Goal.entityName)
        
        do {
            let results = try managedContext.execute(request) as! NSFetchRequestResult
            
            if let goals = results as? [Goal] {
                var earliestDate: Date?
                
                for goal in goals {
                    if let earliest = earliestDate {
                        if let creationDate = goal.creationDate as? Date {
                            if earliest.compare(creationDate) == .orderedDescending {
                                earliestDate = goal.creationDate as Date?
                            }
                        } else {
                            print("Error: COULT NOT PARSE NSDATE? INTO DATE")
                            thrower(CommonError.ParseError as NSError)
                        }
                    } else {
                        earliestDate = goal.creationDate as Date?
                    }
                }
                
                returner(earliestDate)
            } else {
                print("Error: COULD NOT PARSE MANAGEDOBJECTS INTO GOALS")
                thrower(CommonError.ParseError as NSError)
            }
        } catch let error as NSError {
            print("Error: \(error)")
            thrower(error)
        }
        
    }
    
    
    func insert(_ model: GoalModel, _ callback: Callback, orFailWith thrower: Thrower) {
        
    }
    
    
}
