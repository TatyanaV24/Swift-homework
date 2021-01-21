//
//  SlaiderViewController.swift
//  Additional-tasks-for-module-8
//
//  Created by Татьяна Васильченко on 21.01.2021.
//  2. Для галереи картинок (тот же пункт 2) добавьте слайдер https://developer.apple.com/documentation/uikit/uislider
//Что должно происходит при изменении значения слайдера, попробуйте придумать самостоятельно. Я настроила переключение картинок при перемещении слайдера.


import UIKit

class SlaiderViewController: UIViewController {
    
    var catsImage = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].compactMap { UIImage(named: $0)}
    var index = 0 {
        didSet {
            if oldValue != index {
                indexUpdate()
            }
        }
    }
    
    @IBOutlet weak var petsImage: UIImageView!
    @IBOutlet weak var blueSlider: UISlider!
    
    func indexUpdate(){
        guard 0..<catsImage.count ~= index else {return}
        petsImage.image = catsImage[index]
    }
    
    @IBAction func changeImageSlider(_ sender: UISlider) {
        index = Int(round(sender.value))
    }
}
