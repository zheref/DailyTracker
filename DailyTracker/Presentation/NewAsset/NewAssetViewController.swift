//
//  NewAssetViewController.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 10/26/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol NewAssetViewControllerProtocol : ViewProtocol {
    
    func dismiss()
    
}


class NewAssetViewController : UIViewController, UITextFieldDelegate, NewAssetViewControllerProtocol {
    
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var assetTextField: UITextField!
    @IBOutlet weak var purchaseDatePicker: UIDatePicker!
    @IBOutlet weak var lifetimeLabel: UILabel!
    @IBOutlet weak var lifetimeStepper: UIStepper!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var environmentTextField: UITextField!
    @IBOutlet weak var crosscountrySwitch: UISwitch!
    @IBOutlet weak var adventureAbleSwitch: UISwitch!
    @IBOutlet weak var placeStuckSwitch: UISwitch!
    
    @IBOutlet weak var picImageViewHeightConstraint: NSLayoutConstraint!
    
    var presenter = NewAssetPresenter()
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.beforeAppear()
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        presenter.attachView(view: self)
        presenter.onLoad()
        
        assetTextField.returnKeyType = .done
        brandTextField.returnKeyType = .done
        priceTextField.returnKeyType = .done
        categoryTextField.returnKeyType = .done
        environmentTextField.returnKeyType = .done
        
        assetTextField.delegate = self
        brandTextField.delegate = self
        priceTextField.delegate = self
        categoryTextField.delegate = self
        environmentTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.afterAppear()
    }
    
    
    @IBAction func onSaveButtonAction(_ sender: AnyObject) {
        let asset: AssetModel = AssetModel()
        
        asset.kind = assetTextField.text
        asset.buydate = purchaseDatePicker.date as NSDate?
        asset.duration = lifetimeStepper.value as NSNumber?
        asset.brand = brandTextField.text
        asset.paidprice = NSDecimalNumber(string: priceTextField.text)
        asset.category = categoryTextField.text
        asset.environment = environmentTextField.text
        asset.crosscountry = crosscountrySwitch.isOn
        asset.adventure = adventureAbleSwitch.isOn
        asset.placestuck = placeStuckSwitch.isOn
        
        presenter.onSave(asset)
    }
    
    
    func dismiss() {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onLifetimeStepperValueChange(_ sender: UIStepper) {
        lifetimeLabel.text = "\(Int(sender.value)) years"
    }
    
    
    func keyboardDidShow() {
        picImageViewHeightConstraint.constant = 0
    }
    
    
    func keyboardDidHide() {
        picImageViewHeightConstraint.constant = 200
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
