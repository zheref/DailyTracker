//
//  UserModel.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/3/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


class UserModel : ModelProtocol {
    
    var name: String
    var email: String
    
    var originalCD: User?
    
    
    init(_ name: String, withEmail email: String) {
        self.name = name
        self.email = email
    }
    
    
    init(with user: User) {
        name = user.name!
        email = user.email!
        
        originalCD = user
    }
    
}
