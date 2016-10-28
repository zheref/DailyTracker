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
        
        remainingLifeLabel.text = "\(Math.xround(number: model.points, toDecimals: 2))"
        
        if let imageData = model.picture {
            assetPicImageView.image = UIImage(data: imageData as Data)
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        
        let paidprice = model.paidprice! as NSDecimalNumber
        
        purchasePriceLabel.text = "$\(formatter.string(from: paidprice)!)"
        
        let forecastedPrice = model.forecastedPrice as NSDecimalNumber
        let whimPointsNeeded = model.whimPointsNeeded as NSDecimalNumber
        
        renewalPriceLabel.text =
        "\(Int(round(Double(whimPointsNeeded))))w (\(formatter.string(from: forecastedPrice)!))"
    }
    
}
