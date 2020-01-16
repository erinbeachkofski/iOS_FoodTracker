//
//  ViewController.swift
//  Food Tracker
//
//  Created by Erin Beachkofski on 1/6/20.
//  Copyright © 2020 Erin Beachkofski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var setDefaultLabelText: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.
        mealNameLabel.text = "Default Text"
        nameTextField.delegate = self
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
}
