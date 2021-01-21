//
//  StepperViewController.swift
//  Additional-tasks-for-module-8
//
//  Created by Татьяна Васильченко on 20.01.2021.
// 3. Для галереи картинок (пункт 2:)) замените кнопки назад и дальше на UIStepper https://developer.apple.com/documentation/uikit/uistepper
//Воспользуйтесь возможностью задать картинку для кнопок увеличения и уменьшения.

import UIKit

class StepperViewController: UIViewController {
    
    @IBOutlet weak var changeImage: UIImageView!
    @IBOutlet weak var customStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customStepper.minimumValue = 0
        customStepper.maximumValue = 10
        customStepper.setIncrementImage(UIImage(named: "s-1"), for: .normal)
        customStepper.setDecrementImage(UIImage(named: "s-2"), for: .normal)
        customStepper.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
