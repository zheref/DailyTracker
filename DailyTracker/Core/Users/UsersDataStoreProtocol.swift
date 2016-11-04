//
//  UsersDataStoreProtocol.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/4/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


typealias UserReturner = (UserModel) -> Void
typealias UsersReturner = ([UserModel]) -> Void


protocol UsersDataStoreProtocol : DataStoreProtocol {
    
    func getDefault(with returner: UserReturner, orFailWith thrower: Thrower)
    
}
