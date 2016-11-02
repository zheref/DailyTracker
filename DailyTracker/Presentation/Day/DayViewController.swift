//
//  DayViewController.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/31/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol DayViewControllerProtocol : ViewProtocol {
    
}


class DayViewController : UIViewController, DayViewControllerProtocol {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var currentDay: Date!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let day = currentDay {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMMM d"
            navigationItem.title = formatter.string(from: day)
        } else {
            navigationItem.title = "---"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let showingVC = segue.destination as? NewGoalViewController {
            showingVC.preselectedDate = currentDay
        }
        
        super.prepare(for: segue, sender: sender)
    }
    
    
    @IBAction func onAddBarButtonAction(_ sender: AnyObject) {
        performSegue(withIdentifier: KSegues.dayToNewGoal, sender: self)
    }
    
}
