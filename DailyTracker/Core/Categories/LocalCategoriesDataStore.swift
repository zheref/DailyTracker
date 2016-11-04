//
//  LocalCategoriesDataStore.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/4/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


class LocalCategoriesDataStore : CategoriesDataStoreProtocol {
    
    
    static let shared = LocalCategoriesDataStore()
    
    
    private init() {}
    
    
    func retrieveAll(with returner: ([CategoryModel]) -> Void, orFailWith thrower: Thrower) {
        
    }
    
    
    func insert(_ model: CategoryModel, _ callback: Callback, orFailWith thrower: Thrower) {
        
    }

    
    func delete(_ model: CategoryModel, _ callback: Callback, orFailWith thrower: Thrower) {
        
    }
    
    
    func getDefault(with returner: CategoryReturner, orFailWith thrower: Thrower) {
        getStoredDefaultIfExists(with: { category in
            if let category = category {
                returner(category)
            } else {
                let model = CategoryModel(withName: K.DefaultCategory)
                
                let entity = NSEntityDescription.entity(forEntityName: Category.entityName, in: managedContext)
                
                let cd = NSManagedObject(entity: entity!, insertInto: managedContext) as! Category
                
                cd.setValue(model.name, forKey: "name")
                cd.setValue(NSSet(), forKey: "goals")
                
                model.originalCD = cd
                
                do {
                    try managedContext.save()
                    returner(model)
                } catch let error as NSError {
                    thrower(error)
                }
            }
        }, orFailWith: thrower)
    }
    
    
    private func getStoredDefaultIfExists(with returner: (CategoryModel?) -> Void, orFailWith thrower: Thrower) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Category.entityName)
        request.predicate = NSPredicate(format: "name == %@", K.DefaultCategory)
        
        do {
            let results = try managedContext.execute(request)
                as! NSAsynchronousFetchResult<NSFetchRequestResult>
            
            if let categories = results.finalResult as? [Category] {
                if categories.count > 1 {
                    print("Warning: MORE THAN ONE CATEGORIES FOUND WITH DEFAULT NAME")
                }
                
                if categories.count > 0 {
                    returner(CategoryModel(with: categories.first!))
                } else {
                    returner(nil)
                }
            } else {
                print("Error: COULD NOT PARSE MANAGEDOBJECTS INTO CATEGORIES")
                thrower(CommonError.ParseError)
            }
        } catch let error as NSError {
            print("Error: \(error)")
            thrower(error)
        }
    }
    
    
}
