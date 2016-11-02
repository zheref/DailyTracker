//
//  AssetsViewController.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol AssetsViewControllerProtocol : ViewProtocol {
    
    func reload()
    
    func delete(rowAtIndex index: Int)
    
}


class AssetsViewController : UITableViewController, AssetsViewControllerProtocol {
    
    var presenter = AssetsPresenter()
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.beforeAppear()
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        presenter.attachView(view: self)
        presenter.onLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.afterAppear()
    }
    
    
    func reload() {
        tableView.reloadData()
    }
    
    
    func delete(rowAtIndex index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KReuseIdentifiers.assetTableViewCell,
                                                 for: indexPath) as! AssetTableViewCell
        
        cell.apply(model: presenter.items[indexPath.row])
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.delete(itemAtIndex: indexPath.row)
        }
    }

    
    @IBAction func onNewAssetAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: KSegues.assetsToNewAsset, sender: self)
    }
    
    
    
}
