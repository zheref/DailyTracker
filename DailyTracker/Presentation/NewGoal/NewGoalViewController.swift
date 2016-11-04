//
//  NewGoalViewController.swift
//  DailyTracker
//
//  Created by Sergio Daniel Lozano on 11/2/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol NewGoalViewControllerProtocol : ViewProtocol {
    
    func dismiss()
    
}


class NewGoalViewController : UIViewController, NewGoalViewControllerProtocol, UITextFieldDelegate,
    UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var whenDatePicker: UIDatePicker!
    @IBOutlet weak var everyPickerView: UIPickerView!
    
    
    var preselectedDate: Date?
    
    var presenter = NewGoalPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(view: self)
        presenter.onLoad()
        
        everyPickerView.dataSource = self
        everyPickerView.delegate = self
        
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
        dismiss()
    }
    
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onFinishButtonTouchUpInside(_ sender: AnyObject) {
        let model = GoalModel()
        
        model.creationDate = Date() as NSDate
        model.lastUpdateDate = model.creationDate
        model.reminder = whenDatePicker.date as NSDate
        model.repeat = 21
        model.text = goalTextField.text
        
        let selectedPatternIndex = everyPickerView.selectedRow(inComponent: 0)
        model.remindPattern = presenter.repeatPatterns[selectedPatternIndex]["code"]
        
        presenter.onSave(model)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.repeatPatterns.count
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = presenter.repeatPatterns[row]
        return "\(item["label"]!) [\(item["code"]!)]"
    }
    
    
}
