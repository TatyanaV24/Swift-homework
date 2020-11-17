//
//  ThirdViewController.swift
//  DZ 6
//
//  Created by Татьяна Васильченко on 20.10.2020.
//

import UIKit

enum Operator: String {
    case sum = "+"
    case sub = "-"
    case multi = "*"
    case div = "/"
    
    func apply(_ a: Double, _ b: Double) -> Double {
        switch self {
        case .sum:
            return a+b
        case .sub:
            return a-b
        case .multi:
            return a*b
        case .div:
            return a/b
            
        }
        
    }
}

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var firstNumber: UITextField!
    
    @IBOutlet weak var operatorTextField: UITextField!
    
    @IBOutlet weak var secondNumber: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func resultButton(_ sender: Any) {
        
        guard let aText = firstNumber.text,
              let bText = secondNumber.text,
              let operatorText = operatorTextField.text,
              let a = Double(aText),
              let b = Double(bText),
              let op = Operator(rawValue: operatorText) else {
            self.resultLabel.text = "Некорректные данные"
            return
        }
        if b != 0 {
            self.resultLabel.text = "\(String(describing: op.apply(a, b)))"
        } else {
            self.resultLabel.text = "Делить на ноль нельзя"
        }
    }
}
