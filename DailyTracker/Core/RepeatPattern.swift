//
//  RepeatPattern.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/8/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


enum WeekDay : Int {
    case Sunday = 1
    case Monday = 2
    case Tuesday = 3
    case Wednesday = 4
    case Thursday = 5
    case Friday = 6
    case Saturday = 7
}


enum Month : Int {
    case January = 1
    case February = 2
    case March = 3
    case April = 4
    case May = 5
    case June = 6
    case July = 7
    case August = 8
    case September = 9
    case October = 10
    case November = 11
    case December = 12
    
    
    func matchesTrimester(startingWith month: Month) -> Bool {
        let eval = Double(self.rawValue)
        let start = Double(month.rawValue)
        
        return Math.isInteger((eval - start) / 3)
    }
    
    
    func matchesSemester(startingWith month: Month) -> Bool {
        let eval = Double(self.rawValue)
        let start = Double(month.rawValue)
        
        return Math.isInteger((eval - start) / 6)
    }
    
}


enum PatternMatchResolve {
    case NotLikely
    case Likely
    case Match
}


enum RepeatPattern : String
{
    
    case NoRepeat = "n"
    case HalfDay = "h"
    case Daily = "d"
    case Weekly = "w"
    case EveryWeekend = "e"
    case EveryWeekday = "wd"
    case EveryWeekwing = "ww"
    case EveryWeekeven = "we"
    case EveryWeekodd = "wo"
    case Monthly = "m"
    case EveryTrimester = "t"
    case EverySemester = "s"
    case Yearly = "y"
    
    
    static let Values = [NoRepeat, HalfDay, Daily, Weekly, EveryWeekend, EveryWeekday, EveryWeekwing,
                         EveryWeekeven, EveryWeekodd, Monthly, EveryTrimester, EverySemester,
                         Yearly]
    
    
    var label: String {
        switch self {
        case .NoRepeat:
            return "Do not repeat"
        case .HalfDay:
            return "Half day"
        case .Daily:
            return "Daily"
        case .Weekly:
            return "Weekly"
        case .EveryWeekend:
            return "Every weekend"
        case .EveryWeekday:
            return "Every weekday"
        case .EveryWeekwing:
            return "Every weekwing"
        case .EveryWeekeven:
            return "Every weekeven"
        case .EveryWeekodd:
            return "Every weekodd"
        case .Monthly:
            return "Monthly"
        case .EveryTrimester:
            return "Every trimester"
        case .EverySemester:
            return "Every semester"
        case .Yearly:
            return "Yearly"
        }
    }
    
    
    static var patternsAsDictArray: [[String: String]] {
        var array = [[String: String]]()
        
        for value in Values {
            array.append([
                "code": value.rawValue,
                "label": value.label
                ])
        }
        
        return array
    }
    
    
    func matches(dayOfWeek day: WeekDay) -> PatternMatchResolve {
        switch self {
        case .NoRepeat:
            return .Likely
        case .HalfDay:
            return .Match
        case .Daily:
            return .Match
        case .Weekly:
            return .Likely
        case .EveryWeekend:
            if day == .Saturday || day == .Sunday {
                return .Match
            } else {
                return .NotLikely
            }
        case .EveryWeekday:
            if day != .Saturday && day != .Sunday {
                return .Match
            } else {
                return .NotLikely
            }
        case .EveryWeekwing:
            if day == .Monday || day == .Friday {
                return .Match
            } else {
                return .NotLikely
            }
        case .EveryWeekeven:
            if day == .Tuesday || day == .Thursday {
                return .Match
            } else {
                return .NotLikely
            }
        case .EveryWeekodd:
            if day == .Monday || day == .Wednesday || day == .Friday {
                return .Match
            } else {
                return .NotLikely
            }
        case .Monthly:
            return .Likely
        case .EveryTrimester:
            return .Likely
        case .EverySemester:
            return .Likely
        case .Yearly:
            return .Likely
        }
    }
    
}
