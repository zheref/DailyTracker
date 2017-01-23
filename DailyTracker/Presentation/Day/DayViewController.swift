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
        
        guard let goalCell = cell as? GoalTableViewCell else {
            return GoalTableViewCell(style: .default, reuseIdentifier: KReuseIdentifiers.goalTableViewCell)
        }
        
        let item = presenter.items[indexPath.row]
        
        goalCell.goalDescriptionLabel.text = item.model.text!
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "H:mm"
        let time = timeFormatter.string(from: item.model.reminder as Date)
        
        goalCell.timeLabel.text = "\(time)"
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = presenter.items[indexPath.row]
        return item.expanded ? 80 : 50
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.delete(itemAtIndex: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        let item = presenter.items[indexPath.row]
        item.expanded = !item.expanded
        tableView.endUpdates()
    }

    
}
