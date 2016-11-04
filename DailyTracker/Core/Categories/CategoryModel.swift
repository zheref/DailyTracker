//
//  CategoryModel.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/3/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


class CategoryModel : ModelProtocol {
    
    var name: String
    
    var originalCD: Category?
    
    
    init(withName name: String) {
        self.name = name
    }
    
    
    init(with category: Category) {
        self.name = category.name!
        self.originalCD = category
    }
    
}
