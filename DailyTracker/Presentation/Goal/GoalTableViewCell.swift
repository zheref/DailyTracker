//
//  GoalTableViewCell.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 12/7/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit

class GoalTableViewCell : UITableViewCell
{
    // MARK: - CONSTANTS
    
    static let CollapsedHeight: CGFloat = 50
    static let ExpandedHeight: CGFloat = 80
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: - PROPERTIES
    
    var expanded: Bool = false
    
}
