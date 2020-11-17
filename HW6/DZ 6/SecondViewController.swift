//
//  SecondViewController.swift
//  DZ 6
//
//  Created by Татьяна Васильченко on 20.10.2020.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var numTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
      
    @IBAction func enterNum() {
        guard let numText = numTextField.text, let num = Int(numText) else {
            resultLabel.text = "Введите целое число в строку"
            return
        }
        var answer = 1
            if let pow = numTextField.text, let power = Int(pow){
            for _ in 1...power {
                let result = answer.multipliedReportingOverflow(by: answer)
                if result.overflow == false {
                    answer *= num
                    resultLabel.text = "\(String(describing: answer))"
                } else {
                    resultLabel.text = "Превышено допустимое значение диапазона Int. Введите другое чило."
                }
            }
        }
        
   }
}

