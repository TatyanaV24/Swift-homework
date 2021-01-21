//
//  ProgressViewController.swift
//  Additional-tasks-for-module-8
//
//  Created by Татьяна Васильченко on 21.01.2021.
//  4. Для галереи картинок (пункт 2) добавьте UIProgressView https://developer.apple.com/documentation/uikit/uiprogressview
//После нажатия на старт (из доп задачи 3) и начала проигрывания всех картинок этот индикатор должен, показывая прогресс проигрывания.
//Когда картинки начинают проигрываться с самого начала, то ProgressView тоже должен начинаться с начала.
//По нажатию на стоп ProgressView не сбрасывается, а остается в текущем положении.

import UIKit

class ProgressViewController: UIViewController {
    
    var catsImage = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"].compactMap { UIImage(named: $0)}
    var myTime = Timer()
    var index = 0
    
    @IBOutlet weak var playImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
      
    @objc func createTimer(){
        
        self.index = self.index == self.catsImage.count-1 ? 0 : self.index + 1
        playImageView.image = catsImage[index]
        
        if progressView.progress != 1.0 {
            progressView.progress += 0.1 / 1.0
        } else if progressView.progress == 1.0 {
            progressView.progress = 0.0
        }
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
