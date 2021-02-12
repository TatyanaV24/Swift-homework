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
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var customStepper: UIStepper!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customStepper.minimumValue = 0
        customStepper.maximumValue = 10
        customStepper.setIncrementImage(UIImage(named: "s-1"), for: .normal)
        customStepper.setDecrementImage(UIImage(named: "s-2"), for: .normal)
        customStepper.translatesAutoresizingMaskIntoConstraints = false
        loadingActivity.hidesWhenStopped = true
    }
    
    @objc func changeCatsImage(){
        self.index = self.index == self.catsImage.count-1 ? 0 : self.index + 1
        playImageView.image = catsImage[index]
        
        if progressView.progress != 1.0 {
            progressView.progress += 0.1 / 1.0
        } else if progressView.progress == 1.0 {
            progressView.progress = 0.0
        }
    }
    
    @IBAction func actionForButton(_ sender: UIButton) {
        myTime = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(changeCatsImage),
            userInfo: nil,
            repeats: true)
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        self.myTime.invalidate()
    }
    
    @IBAction func actionSlider(_ sender: UISlider) {
        if index != Int(round(sender.value)) {
            changeCatsImage()
        }
    }
    
    @IBAction func myStepper(_ sender: UIStepper) {
        if  index != Int(sender.value) {
            changeCatsImage()
        }
    }
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        if sender.isOn {
            playImageView.alpha = 1
            loadingActivity.stopAnimating()
        } else{
            playImageView.alpha = 0.3
            loadingActivity.startAnimating()
        }
    }
}
