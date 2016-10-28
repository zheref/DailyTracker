//
//  AssetTableViewCell.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


class AssetTableViewCell : UITableViewCell {
    
    @IBOutlet weak var assetPicImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var remainingLifeLabel: UILabel!
    @IBOutlet weak var brandAndIntervalLabel: UILabel!
    @IBOutlet weak var purchasePriceLabel: UILabel!
    @IBOutlet weak var renewalPriceLabel: UILabel!
    
    
    func apply(model: AssetModel) {
        titleLabel.text = model.kind
        brandAndIntervalLabel.text = "\(model.brand!.uppercased()) | \(model.purchaseYear) - \(model.expiringYear)"
        purchasePriceLabel.text = "$\(model.paidprice!)"
        
        remainingLifeLabel.text = "\(model.points)"
    }
    
}
