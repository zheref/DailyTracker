//
//  LocalUsersDataStore.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/4/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


class LocalUsersDataStore : UsersDataStoreProtocol {
    
    
    static let shared = LocalUsersDataStore()
    
    
    private init() {}
    
    
    func retrieveAll(with returner: UsersReturner, orFailWith thrower: Thrower) {
        
    }
    
    
    func insert(_ model: UserModel, _ callback: Callback, orFailWith thrower: Thrower) {
        
    }
    
    
    func delete(_ model: UserModel, _ callback: Callback, orFailWith thrower: Thrower) {
        
    }
    
    
    func getDefault(with returner: UserReturner, orFailWith thrower: Thrower) {
        getStoredDefaultIfExists(with: { user in
            if let user = user {
                returner(user)
            } else {
                let model = UserModel("Not Identified", withEmail: K.DefaultEmail)
                
                let entity = NSEntityDescription.entity(forEntityName: User.entityName, in: managedContext)
                
                let cd = NSManagedObject(entity: entity!, insertInto: managedContext) as! User
                
                cd.setValue(model.name, forKey: "name")
                cd.setValue(model.email, forKey: "email")
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
    
    
    private func getStoredDefaultIfExists(with returner: (UserModel?) -> Void, orFailWith thrower: Thrower) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: User.entityName)
        request.predicate = NSPredicate(format: "email == %@", K.DefaultEmail)
        
        do {
            let results = try managedContext.execute(request)
                as! NSAsynchronousFetchResult<NSFetchRequestResult>
            
            if let users = results.finalResult as? [User] {
                if users.count > 1 {
                    print("Warning: MORE THAN ONE USERS FOUND WITH DEFAULT EMAIL")
                }
                
                if users.count > 0 {
                    returner(UserModel(with: users.first!))
                } else {
                    returner(nil)
                }
            } else {
                print("Error: COULD NOT PARSE MANAGEDOBJECTS INTO USERS")
                thrower(CommonError.ParseError)
            }
        } catch let error as NSError {
            print("Error: \(error)")
            thrower(error)
        }
    }
    
}
