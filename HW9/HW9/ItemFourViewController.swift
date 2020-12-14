//
//  ItemFourViewController.swift
//  HW9
//
//  Created by Татьяна Васильченко on 08.12.2020.
//

import UIKit

class ItemFourViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBAction func hideButton(_ sender: UIButton) {
        if heightConstraint.constant == 31 {
            heightConstraint.constant = 119
            myLabel.numberOfLines = 5
        } else {
            heightConstraint.constant = 31
            myLabel.numberOfLines = 1
        }
    }
}
