//
//  ViewController.swift
//  HW14
//
//  Created by mac on 25.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var secondNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.text = Persistance.shared.userName
        secondNameTextField.text = Persistance.shared.userSecondName
    }

    
    @IBAction func saveButton(_ sender: Any) {
        if let userNameText = firstNameTextField.text  {
            Persistance.shared.userName = userNameText
        }
        if let userSecondNameText = secondNameTextField.text {
            Persistance.shared.userSecondName = userSecondNameText
        }
    }
    
    

}

