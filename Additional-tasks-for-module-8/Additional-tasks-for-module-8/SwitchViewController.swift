//
//  SwitchViewController.swift
//  Additional-tasks-for-module-8
//
//  Created by Татьяна Васильченко on 21.01.2021.
// 6. UIImageView + UISwitch. https://developer.apple.com/documentation/uikit/uiswitch
//По изменению значения UISwitch меняется прозрачность UIImageView, например, с 0.3 до 1.

import UIKit

class SwitchViewController: UIViewController {
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        if sender.isOn  {
            catImage.alpha = 1
        } else {
            catImage.alpha = 0.3
        }
    }
}
