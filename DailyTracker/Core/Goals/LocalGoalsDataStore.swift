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
    internal func delete(_ model: GoalModel, _ callback: () -> Void, orFailWith thrower: (Error) -> Void) {
        
    }

    
    
    static let futureLapseInDays = 21
    
    
    static var shared: LocalGoalsDataStore = {
        return LocalGoalsDataStore()
    }()
    
    
    private init() {}
    
    
    func retrieveAll(with returner: GoalsReturner, orFailWith thrower: Thrower) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Goal.entityName)
        
        do {
            let results = try managedContext.execute(request) as! NSAsynchronousFetchResult<NSFetchRequestResult>
            
            if let goals = results.finalResult as? [Goal] {
                returner(goals.map({ goal -> GoalModel in
                    return GoalModel(with: goal)
                }))
            } else {
                print("Error: COULD NOT PARSE MANAGEDOBJECTS INTO GOALS")
                thrower(CommonError.ParseError)
            }
        } catch let error as NSError {
            print("Error: \(error)")
            thrower(error)
        }
    }
    
    
    func retrieveAvailableDates() -> [Date] {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dates = [Date]()
        let today = Date()
        
        var daysComponent = DateComponents()
        
        for days in 0...LocalGoalsDataStore.futureLapseInDays {
            daysComponent.day = days
            dates.append(calendar.date(byAdding: daysComponent, to: today)!)
        }
        
        return dates
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
                
                if (earliestDate == nil) {
                    earliestDate = Date()
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
        
        var theUser: User?
        var theCategory: Category?
        
        LocalUsersDataStore.shared.getDefault(with: { user in
            
            theUser = user.originalCD!
            
            LocalCategoriesDataStore.shared.getDefault(with: { category in
                
                theCategory = category.originalCD!
                
                let entity = NSEntityDescription.entity(forEntityName: Goal.entityName, in: managedContext)
                let cd = NSManagedObject(entity: entity!, insertInto: managedContext) as! Goal
                
                cd.setValue(theUser, forKey: "user")
                cd.setValue(theCategory, forKey: "category")
                
                cd.setValue(model.creationDate, forKey: "creationDate")
                cd.setValue(model.expiringDate, forKey: "expiringDate")
                cd.setValue(model.lastUpdateDate, forKey: "lastUpdateDate")
                cd.setValue(model.reminder, forKey: "reminder")
                cd.setValue(model.remindPattern, forKey: "remindPattern")
                cd.setValue(model.repeat, forKey: "repeat")
                cd.setValue(model.text, forKey: "text")
                
                cd.setValue(NSSet(), forKey: "children")
                cd.setValue(NSSet(), forKey: "records")
                
                do {
                    model.originalCD = cd
                    try managedContext.save()
                    callback()
                } catch let error as NSError {
                    thrower(error)
                }
                
            }, orFailWith: thrower)
            
        }, orFailWith: thrower)
    }
    
    
}
