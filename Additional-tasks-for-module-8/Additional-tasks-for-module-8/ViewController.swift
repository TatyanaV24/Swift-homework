//
//  ViewController.swift
//  Additional-tasks-for-module-8
//
//  Created by Татьяна Васильченко on 11.12.2020.
//  1. Для галереи картинок (пункт 2 про 10 картинок) добавить кнопку старт и стоп.
//По нажатию на старт начинают проигрываться анимировано все картинки.
//По нажатию на стоп останавливается.
//Останавливать необходимо на той картинке, которая показывалась в момент нажатия на стоп (сложная задача).
//Для решения поисследуйте документацию UIImageView на методы, которые могут помочь https://developer.apple.com/documentation/uikit/uiimageview

import UIKit

class ViewController: UIViewController {
    
    var catsImage = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].compactMap { UIImage(named: $0)}
    var myTime = Timer()
    var index = 0
    
    @IBOutlet weak var playImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    @objc func createTimer(){
        self.index = self.index == self.catsImage.count-1 ? 0 : self.index + 1
        playImageView.image = catsImage[index]
    }
    
    @IBAction func actionForButton(_ sender: UIButton) {
        if sender == playButton {
            myTime = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(createTimer),
                userInfo: nil,
                repeats: true)
        } else {
            self.myTime.invalidate()
        }
    }
}
