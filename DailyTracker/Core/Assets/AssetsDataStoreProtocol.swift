//
//  AssetsDataStoreProtocol.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/26/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


typealias AssetsReturner = ([AssetModel]) -> Void


protocol AssetsDataStoreProtocol : DataStoreProtocol {
    
    func retrieve(byDate date: Date, with returner: AssetsReturner, orFailWith thrower: Thrower)
    
}
