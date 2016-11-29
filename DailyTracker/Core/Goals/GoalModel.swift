//
//  GoalEntity.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


class GoalModel : ModelProtocol
{
    
    init(_ text: String, on date: Date) {
        creationDate = Date()
        lastUpdateDate = creationDate
        
        self.text = text
        
        reminder = date
        repeatPattern = .Daily
        repetitions = 21
        
        points = 1
    }
    
    
    init(with goal: Goal) {
        creationDate = goal.creationDate! as Date
        expiringDate = goal.expiringDate as Date?
        lastUpdateDate = goal.lastUpdateDate! as Date
        
        if let scheduledDate = goal.reminder {
            reminder = scheduledDate as Date
        } else {
            reminder = creationDate
        }
        
        if let pattern = goal.remindPattern {
            repeatPattern = RepeatPattern(rawValue: pattern)!
        } else {
            repeatPattern = .NoRepeat
        }
        
        
        repetitions = goal.repetitions!.intValue
        text = goal.text
        
        points = goal.points!.intValue
        
        category = goal.category
        children = goal.children
        parent = goal.parent
        user = goal.user
        records = goal.records
    }
    
    
    var creationDate: Date
    var expiringDate: Date?
    var lastUpdateDate: Date
    var reminder: Date
    
    var repeatPattern: RepeatPattern
    var repetitions: Int
    
    var points: Int
    
    var text: String?
    
    var category: Category?
    var children: NSSet?
    var parent: Goal?
    var user: User?
    var records: NSSet?
    
    
    var originalCD: Goal?
    
    
    func valid(on date: Date) -> Bool {
        print("Validating if goal is valid on \(date)")
        
        let later = laterOr(onDate: date)
        let matchPattern = matchesPattern(on: date)
        let repetitionsLeft = repetitionsRemaining(on: date)
        
        let valid = later && matchPattern && repetitionsLeft
        
        print("Goal is valid? = \(valid)")
        
        return valid
    }
    
    
    func laterOr(onDate date: Date) -> Bool {
        return date.compare(reminder) != .orderedAscending
    }
    
    
    func matchesPattern(on date: Date) -> Bool {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let componentsToUse: Set<Calendar.Component> = [.weekday, .day, .month]
        
        let evaluatingComponents = calendar.dateComponents(componentsToUse, from: date)
        let evaluatingWeekday = WeekDay(rawValue: evaluatingComponents.weekday!)!
        
        let matching = repeatPattern.matches(dayOfWeek: evaluatingWeekday)
        
        
        if matching == .Match {
            
            return true
            
        } else if matching == .NotLikely {
            
            return false
            
        } else { // Likely
            
            let scheduledComponents = calendar.dateComponents(componentsToUse, from: reminder)
            
            switch repeatPattern {
            case .NoRepeat:
                return reminder.compare(date) == .orderedSame
            case .Weekly:
                let scheduledWeekday = WeekDay(rawValue: scheduledComponents.weekday!)
                return evaluatingWeekday == scheduledWeekday
            case .Monthly:
                let evaluatingDay = evaluatingComponents.day
                let scheduledDay = scheduledComponents.day
                return evaluatingDay == scheduledDay
            case .EveryTrimester:
                let evaluatingDay = evaluatingComponents.day
                let scheduledDay = scheduledComponents.day
                
                let evaluatingMonth = Month(rawValue: evaluatingComponents.month!)
                let scheduledMonth = Month(rawValue: scheduledComponents.month!)
                
                return evaluatingDay == scheduledDay &&
                    evaluatingMonth!.matchesTrimester(startingWith: scheduledMonth!)
            case .EverySemester:
                let evaluatingDay = evaluatingComponents.day
                let scheduledDay = scheduledComponents.day
                
                let evaluatingMonth = Month(rawValue: evaluatingComponents.month!)
                let scheduledMonth = Month(rawValue: scheduledComponents.month!)
                
                return evaluatingDay == scheduledDay &&
                    evaluatingMonth!.matchesSemester(startingWith: scheduledMonth!)
            case .Yearly:
                let evaluatingDay = evaluatingComponents.day
                let scheduledDay = scheduledComponents.day
                
                let evaluatingMonth = Month(rawValue: evaluatingComponents.month!)
                let scheduledMonth = Month(rawValue: scheduledComponents.month!)
                
                return evaluatingDay == scheduledDay && evaluatingMonth == scheduledMonth
            default:
                print("ERROR: Evaluating pattern match when having determinate result: \(matching)")
                return false
            }
            
        }
        
        
        
    }
    
    
    func repetitionsRemaining(on date: Date) -> Bool {
        // TODO
        return true
    }
    
}
