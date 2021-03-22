//
//  ViewController.swift
//  HW-13
//
//  Created by Татьяна Васильченко on 18.03.2021.
//1. Изменение цвета фона квадрата на жёлтый.
//2. Перемещение в правый верхний угол экрана.
//3. Закругление краёв, чтобы квадрат выглядел как круг.
//4. Поворот на 180 градусов.
//5. «Исчезание».
//6. Сначала увеличение в два раза, потом анимированное уменьшение обратно.
//7. Бесконечную анимацию поворота.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pinkView: UIView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var sixLabel: UILabel!
    @IBOutlet weak var sevenLabel: UILabel!
    
    var numberArray:[UILabel] = []
    var index = 0
    var buttonsPressed: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberArray = [oneLabel, twoLabel,threeLabel,fourLabel,fiveLabel,sixLabel,sevenLabel]
        pinkView.alpha = 1
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        self.buttonsPressed.append(sender)
        if buttonsPressed.count == 1 {
            self.numberArray[index].textColor = UIColor.blue
        } else {
            self.index = self.index == self.numberArray.count-1 ? 0 : self.index + 1
            self.numberArray[index].textColor = UIColor.blue
        }
        changeView()
        }
    
    @IBAction func previousButton(_ sender: UIButton) {
        self.buttonsPressed.append(sender)
        if buttonsPressed.count == 1 {
            self.index = self.numberArray.count - 1
            self.numberArray[index].textColor = UIColor.red
         } else {
            self.index = self.index == 0 ? self.numberArray.count - 1 : self.index - 1
            self.numberArray[index].textColor = UIColor.red
        }
        changeView()
    }
    
    func changeView() {
        switch index{
        case 0: //Изменение цвета фона квадрата на жёлтый.
            UIView.animate(withDuration: 2, delay: 0.3, options: .autoreverse, animations: {
                self.pinkView.backgroundColor = UIColor.yellow
            })  {(isCompleted) in self.pinkView.backgroundColor = UIColor.systemPink
            }
        case 1: //Перемещение в правый верхний угол экрана.
            UIView.animate(withDuration: 2.0, animations: {
                self.pinkView.frame.origin.x = 181
                self.pinkView.frame.origin.y = 0
            }){(isCompleted) in self.pinkView.frame.origin.x = 89
                self.pinkView.frame.origin.y = 268
            }
        case 2: // Закругление краёв, чтобы квадрат выглядел как круг.
            
            UIView.animate(withDuration: 2, delay: 0, options: .autoreverse, animations: {
                self.pinkView.layer.cornerRadius = self.pinkView.layer.bounds.size.width / 2
            })  {(isCompleted) in self.pinkView.layer.cornerRadius = 0
            }
        case 3: //Поворот на 180 градусов.
            UIView.animate(withDuration: 2, delay: 0, options: .preferredFramesPerSecond30,
                           animations: {
                            self.pinkView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                           }, completion: nil)
        case 4: //«Исчезание».
            UIView.animate(withDuration: 2, animations: {
                self.pinkView.alpha = 0
            }) {(isCompleted) in self.pinkView.alpha = 1
            }
        case 5: //Сначала увеличение в два раза, потом анимированное уменьшение обратно.
            UIView.animate(withDuration: 2, delay: 0, animations: {
                self.pinkView.transform = CGAffineTransform(scaleX: 2, y: 2)
            }){(isCompleted) in self.pinkView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        case 6: //Бесконечную анимацию поворота
            let animation = CABasicAnimation(keyPath: "transform.rotation")
            animation.fromValue = NSNumber(value: 0)
            animation.toValue = NSNumber(value:Float.pi * 2.0)
            animation.duration = 2.0
            animation.repeatCount = Float.infinity
            pinkView.layer.add(animation, forKey: "transform.rotation")
        default:
            break
        }
    }
}
