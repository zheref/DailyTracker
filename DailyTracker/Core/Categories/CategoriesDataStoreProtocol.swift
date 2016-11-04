//
//  CategoriesDataStoreProtocol.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/4/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


typealias CategoriesReturner = ([CategoryModel]) -> Void
typealias CategoryReturner = (CategoryModel) -> Void


protocol CategoriesDataStoreProtocol : DataStoreProtocol {
    
    func getDefault(with returner: CategoryReturner, orFailWith thrower: Thrower)
    
}
