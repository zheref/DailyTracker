//
//  DayPresenter.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/3/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


class DayPresenter : PresenterProtocol {
    
    // MARK: INSTANCE MEMBERS
    
    var vc: DayViewControllerProtocol?
    var items = [GoalModel]()
    
    
    // MARK: EXPOSURE OPERATIONS
    
    
    func attachView(view: DayViewControllerProtocol) {
        vc = view
    }
    
    
    func onLoad() {
        LocalGoalsDataStore.shared.retrieveAll(with: { goals in
            items = goals
            vc?.reload()
        }, orFailWith: { error in
            print("Error: \(error)")
        })
    }
    
    
    func beforeAppear() {
        
    }
    
    
    func afterAppear() {
        
    }
    
}
