//
//  Globals.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


typealias Thrower = (Error) -> Void
typealias ErrorThrower = (NSError) -> Void
typealias Callback = () -> Void


protocol PresenterProtocol : class {
    associatedtype View = ViewProtocol
    
    var vc: View? { get set }
    
    func attachView(view: View)
    
    func onLoad()
    
    func beforeAppear()
    
    func afterAppear()
}

protocol ViewProtocol : class {
    
    
    
}

protocol RepositoryProtocol : class {
    associatedtype DataStore = DataStoreProtocol
    
    var dataStore: DataStore { get set }
}

protocol ModelProtocol : class {
    
}


protocol DataStoreProtocol : class {
    
    associatedtype Model = ModelProtocol
    
    func retrieveAll(with returner: ([Model]) -> Void, orFailWith thrower: Thrower)
    
    func insert(_ model: Model, _ callback: Callback, orFailWith thrower: Thrower)
    
}


extension DataStoreProtocol {
    
    var managedContext: NSManagedObjectContext {
        return AppDelegate.shared.managedObjectContext
    }
    
}


enum CommonError : Error {
    
    case ParseError
    
}
