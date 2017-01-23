//
//  DayPresenter.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/3/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


class DayGoal {
    var model: GoalModel
    var expanded: Bool
    
    init(model: GoalModel) {
        expanded = false
        self.model = model
    }
}


class DayPresenter : PresenterProtocol {
    
    // MARK: INSTANCE MEMBERS
    
    var vc: DayViewControllerProtocol?
    var items = [DayGoal]()
    
    var currentDate: Date!
    
    
    // MARK: EXPOSURE OPERATIONS
    
    
    func attachView(view: DayViewControllerProtocol) {
        vc = view
    }
    
    
    private func reloadData() {
        LocalGoalsDataStore.shared.retrieveAll(with: { goals in
            let filteredGoals = goals.filter({ goal -> Bool in
                return goal.valid(on: currentDate)
            })
            
            items = filteredGoals.map({ (model: GoalModel) -> DayGoal in
                return DayGoal(model: model)
            })
            
            vc?.reload()
        }, orFailWith: { error in
            print("Error: \(error)")
        })
    }
    
    
    func onLoad() {
        reloadData()
    }
    
    
    func beforeAppear() {
        
    }
    
    
    func afterAppear() {
        reloadData()
    }
    
    
    func delete(itemAtIndex index: Int) {
        LocalGoalsDataStore.shared.delete(items[index].model, {
            print("Success deleting goal with name: \(items[index].model.text)")
            items.remove(at: index)
            vc?.delete(rowAtIndex: index)
        }, orFailWith: { error in
            print("Error: \(error)")
        })
    }
    
}
