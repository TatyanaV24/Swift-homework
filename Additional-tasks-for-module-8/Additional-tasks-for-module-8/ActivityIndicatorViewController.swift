//
//  ActivityIndicatorViewController.swift
//  Additional-tasks-for-module-8
//
//  Created by Татьяна Васильченко on 21.01.2021.
// 7. Добавить UIActivityIndicatorView в UIImageView из пункта 6 https://developer.apple.com/documentation/uikit/uiactivityindicatorview
//Если прозрачность 0.3, то показывать анимировано индикатор загрузки, если 1, то не показывать.

import UIKit

class ActivityIndicatorViewController: UIViewController {
    
    @IBOutlet weak var rabbitImage: UIImageView!
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingActivity.hidesWhenStopped = true
    }
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        if sender.isOn {
            rabbitImage.alpha = 1
            loadingActivity.stopAnimating()
        } else{
            rabbitImage.alpha = 0.3
            loadingActivity.startAnimating()
        }
    }
}
