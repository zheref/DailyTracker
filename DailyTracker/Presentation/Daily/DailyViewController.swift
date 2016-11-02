//
//  DailyViewController.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/24/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol DailyViewControllerProtocol : ViewProtocol {
    
    
    
}


class DailyViewController : UIPageViewController, UIPageViewControllerDelegate,
    UIPageViewControllerDataSource, DailyViewControllerProtocol {
    
    
    override func viewDidLoad() {
        let vc = vcontroller(forDate: Date())
        setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        
        delegate = self
        dataSource = self
    }
    
    
    private func vcontroller(forDate date: Date) -> DayViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let v = storyboard.instantiateViewController(withIdentifier: KReuseIdentifiers.dayVC) as! DayViewController
        v.currentDay = date
        return v
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let dvc = viewController as? DayViewController else {
            return nil
        }
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var daysComponent = DateComponents()
        daysComponent.day = -1
        
        let currentDay = calendar.date(byAdding: daysComponent, to: dvc.currentDay)!
        
        return vcontroller(forDate: currentDay)
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let dvc = viewController as? DayViewController else {
            return nil
        }
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var daysComponent = DateComponents()
        daysComponent.day = 1
        
        let currentDay = calendar.date(byAdding: daysComponent, to: dvc.currentDay)!
        
        return vcontroller(forDate: currentDay)
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
