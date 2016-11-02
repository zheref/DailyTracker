//
//  LocalAssetsDataStore.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/26/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


class LocalAssetsDataStore : AssetsDataStoreProtocol {
    
    
    func retrieveAll(with returner: AssetsReturner, orFailWith thrower: Thrower) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Asset.entityName)
        
        do {
            let results = try managedContext.execute(request) as! NSAsynchronousFetchResult<NSFetchRequestResult>
            
            if let assets = results.finalResult as? [Asset] {
                returner(assets.map({ asset -> AssetModel in
                    return AssetModel(with: asset)
                }))
            } else {
                print("Error: COULD NOT PARSE MANAGEDOBJECTS INTO ASSETS")
                thrower(CommonError.ParseError)
            }
        } catch let error as NSError {
            print("Error: \(error)")
            thrower(error)
        }
    }
    
    
    func delete(_ model: AssetModel, _ callback: Callback, orFailWith thrower: Thrower) {
        managedContext.delete(model.originalCD!)
        
        do {
            try managedContext.save()
            callback()
        } catch let error as NSError {
            thrower(error)
        }
    }
    
    
    func retrieve(byDate date: Date, with returner: AssetsReturner, orFailWith thrower: Thrower) {
        
    }
    
    
    func insert(_ model: AssetModel, _ callback: Callback, orFailWith thrower: Thrower) {
        let _ = model.coreDataVersion(with: managedContext)
        
        do {
            try managedContext.save()
            callback()
        } catch let error as NSError {
            thrower(error)
        }
    }
    
    
}
