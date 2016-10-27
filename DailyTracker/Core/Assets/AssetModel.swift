//
//  AssetModel.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/26/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


class AssetModel : ModelProtocol {
    
    init() {}
    
    init(with asset: Asset) {
        buydate = asset.buydate
        kind = asset.kind
        brand = asset.brand
        category = asset.category
        environment = asset.environment
        paidprice = asset.paidprice
        duration = asset.duration
        renewprice = asset.renewprice
        adventure = asset.adventure?.boolValue
        crosscountry = asset.crosscountry?.boolValue
        placestuck = asset.placestuck?.boolValue
        savingtime = asset.savingtime
        picture = asset.picture
        whimpoints = asset.whimpoints
    }
    
    
    var buydate: NSDate?
    var kind: String?
    var brand: String?
    var category: String?
    var environment: String?
    var paidprice: NSDecimalNumber?
    var duration: NSNumber?
    var renewprice: NSDecimalNumber?
    var adventure: Bool?
    var crosscountry: Bool?
    var placestuck: Bool?
    var savingtime: NSNumber?
    var picture: NSData?
    var whimpoints: Earning?
    
    
    func coreDataVersion(with context: NSManagedObjectContext) -> Asset {
        let entity = NSEntityDescription.entity(forEntityName: Asset.entityName, in: context)
        
        let asset = NSManagedObject(entity: entity!, insertInto: context) as! Asset
        
        asset.setValue(buydate, forKey: "buydate")
        asset.setValue(kind, forKey: "kind")
        asset.setValue(brand, forKey: "brand")
        asset.setValue(category, forKey: "category")
        asset.setValue(environment, forKey: "environment")
        asset.setValue(paidprice, forKey: "paidprice")
        asset.setValue(duration, forKey: "duration")
        asset.setValue(renewprice, forKey: "renewprice")
        asset.setValue(adventure, forKey: "adventure")
        asset.setValue(crosscountry, forKey: "crosscountry")
        asset.setValue(placestuck, forKey: "placestuck")
        asset.setValue(savingtime, forKey: "savingtime")
        asset.setValue(picture, forKey: "picture")
        asset.setValue(whimpoints, forKey: "whimpoints")
        
        return asset
    }
    
}
