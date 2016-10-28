//
//  AssetsPresenter.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


class AssetsPresenter : PresenterProtocol {
    
    var vc: AssetsViewControllerProtocol?
    
    var items = [AssetModel]()
    
    func attachView(view: AssetsViewControllerProtocol) {
        vc = view
    }
    
    
    func onLoad() {
        let dataStore = LocalAssetsDataStore()
        
        dataStore.retrieveAll(with: { assets in
            items = assets
            vc?.reload()
        }) { error in
            print("Error: \(error)")
        }
    }
    
    
    func beforeAppear() {
        
    }
    
    
    func afterAppear() {
        vc?.reload()
    }
    
}
