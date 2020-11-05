//
//  ViewController.swift
//  DZ 6
//
//  Created by Татьяна Васильченко on 04.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var printNameLabel: UILabel!
    
    
    @IBAction func saveName() {
        if let userName = nameTextField.text {
            printNameLabel.text! += userName + " "
        }
        
    }
    
}

