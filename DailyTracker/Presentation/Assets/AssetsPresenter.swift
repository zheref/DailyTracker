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
    
    
    func attachView(view: AssetsViewControllerProtocol) {
        vc = view
    }
    
    
    func onLoad() {
        
    }
    
    
    func beforeAppear() {
        
    }
    
    
    func afterAppear() {
        
    }
    
}
