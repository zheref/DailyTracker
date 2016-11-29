//
//  DayViewController.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/31/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol DayViewControllerProtocol : ViewProtocol {
    
    func reload()
    
    func delete(rowAtIndex index: Int)
    
}


class DayViewController : UIViewController, DayViewControllerProtocol,
    UITableViewDataSource, UITableViewDelegate
{
    
    // MARK: OUTLETS
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var goalsTableView: UITableView!
    
    
    var presenter = DayPresenter()
    
    var currentDay: Date! {
        didSet {
            presenter.currentDate = currentDay
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(view: self)
        
        if let day = currentDay {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMMM d"
            navigationItem.title = formatter.string(from: day)
        } else {
            navigationItem.title = "---"
        }
        
        presenter.onLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.afterAppear()
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
    
    
    func reload() {
        goalsTableView.reloadData()
    }
    
    
    func delete(rowAtIndex index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        goalsTableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: KReuseIdentifiers.goalTableViewCell)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: KReuseIdentifiers.goalTableViewCell)
            cell!.selectionStyle = .default
        }
        
        let item = presenter.items[indexPath.row]
        
        cell!.textLabel?.text = item.text!
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "H:mm"
        let time = timeFormatter.string(from: item.reminder as Date)
        
        cell!.detailTextLabel?.text = "\(time)"
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.delete(itemAtIndex: indexPath.row)
        }
    }

    
}
