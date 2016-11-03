//
//  NewGoalPresenter.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/2/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


class NewGoalPresenter : PresenterProtocol {
    
    var vc: NewGoalViewControllerProtocol?
    
    let repeatPatterns = [
        ["code": "h", "label": "Half day"],
        ["code": "d", "label": "Daily"],
        ["code": "w", "label": "Weekly"],
        ["code": "e", "label": "Every weekend"],
        ["code": "wd", "label": "Every weekday"],
        ["code": "we", "label": "Every monday and friday"],
        ["code": "wm", "label": "Every tuesday and thursday"],
        ["code": "m", "label": "Monthly"],
        ["code": "t", "label": "Every trimester"],
        ["code": "s", "label": "Every semester"],
        ["code": "y", "label": "Yearly"]
    ]
    
    
    func attachView(view: NewGoalViewControllerProtocol) {
        
    }
    
    
    func onLoad() {
        
    }
    
    
    func beforeAppear() {
        
    }
    
    
    func afterAppear() {
        
    }
    
    
    func onSave(_ goal: GoalModel) {
        LocalGoalsDataStore.shared.insert(goal, {
            // Succeded
            
            vc?.dismiss()
        }) { (error) in
            print("Error: \(error)")
        }
    }
    
}
