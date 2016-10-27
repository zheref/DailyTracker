//
//  NewAssetPresenter.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/26/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


class NewAssetPresenter : PresenterProtocol {
    
    var vc: NewAssetViewControllerProtocol?
    
    
    func attachView(view: NewAssetViewControllerProtocol) {
        vc = view
    }
    
    
    func onLoad() {
        
    }
    
    
    func beforeAppear() {
        
    }
    
    
    func afterAppear() {
        
    }
    
    
    func onSave(_ asset: AssetModel) {
        let dataStore = LocalAssetsDataStore()
        
        dataStore.insert(asset, {
            // Succeded
            
            vc?.dismiss()
        }) { (error) in
            print("Error: \(error)")
        }
    }
    
}
