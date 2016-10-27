//
//  AssetsViewController.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol AssetsViewControllerProtocol : ViewProtocol {
    
}


class AssetsViewController : UITableViewController, AssetsViewControllerProtocol {
    

    @IBAction func onNewAssetAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: KSegues.assetsToNewAsset, sender: self)
    }
    
    
    
}
