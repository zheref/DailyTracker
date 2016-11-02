//
//  NewGoalViewController.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/2/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol NewGoalViewControllerProtocol : ViewProtocol {
    
}


class NewGoalViewController : UIViewController, NewGoalViewControllerProtocol, UITextFieldDelegate {
    
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var whenDatePicker: UIDatePicker!
    @IBOutlet weak var everyPickerView: UIPickerView!
    
    
    var preselectedDate: Date?
    
    
    override func viewDidLoad() {
        if let date = preselectedDate {
            whenDatePicker.date = date
            whenDatePicker.minimumDate = date
        }
        
        goalTextField.returnKeyType = .done
        goalTextField.delegate = self
        
        goalTextField.becomeFirstResponder()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func onCloseButtonTouchUpInside(_ sender: AnyObject) {
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func onFinishButtonTouchUpInside(_ sender: AnyObject) {
        
    }
    
    
}
