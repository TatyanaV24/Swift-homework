//
//  SegmentViewController.swift
//  HW8
//
//  Created by Татьяна Васильченко on 17.11.2020.
//

import UIKit

class SegmentViewController: UIViewController {
    
    var mySegmentControl = UISegmentedControl()
    var imageViewOne = UIImageView()
    var imageViewTwo = UIImageView()
    var textFieldOne = UITextField()
    var textFieldTwo = UITextField()
    var yesButton = UIButton()
    var noButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // создание сегмент контроллера
        mySegmentControl = UISegmentedControl(items: ["one", "two", "three"])
        mySegmentControl.frame = CGRect(x: 78, y: 517, width: 259, height: 30)
        mySegmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        // создание двух textField
        self.textFieldOne.frame = CGRect(x: 82, y: 234, width: 246, height: 34)
        self.textFieldOne.backgroundColor = UIColor.systemGray6
        textFieldOne.text = "Привет!"
        self.textFieldTwo.frame = CGRect(x: 82, y: 306, width: 246, height: 34)
        self.textFieldTwo.backgroundColor = UIColor.systemGray6
        textFieldTwo.text = "Я изучаю UISegmentedControl"
        // создание двух кнопок
        self.yesButton.frame = CGRect(x: 111, y: 234, width: 191, height: 93)
        self.yesButton.backgroundColor = UIColor.gray
        yesButton.layer.cornerRadius = 7
        yesButton.setTitle("Yes", for: .normal)
        self.noButton.frame = CGRect(x: 111, y: 374, width: 191, height: 93)
        self.noButton.backgroundColor = UIColor.gray
        noButton.layer.cornerRadius = 7
        noButton.setTitle("No", for: .normal)
        // создание двух картинок
        imageViewOne.image = UIImage(named: "9")
        self.imageViewOne.frame = CGRect(x: 36, y: 574, width: 158, height: 164)
        imageViewOne.layer.cornerRadius = imageViewOne.frame.size.width / 2
        imageViewOne.clipsToBounds = true
        imageViewTwo.image = UIImage(named: "10")
        self.imageViewTwo.frame = CGRect(x: 218, y: 574, width: 158, height: 164)
        imageViewTwo.layer.cornerRadius = imageViewTwo.frame.size.width / 2
        imageViewTwo.clipsToBounds = true
        //        enum View {
        //            case view1:textFieldOne, textFieldTwo
        //            case view2:imageViewOne, imageViewTwo
        //            case view3:yesButton, noButton
        //        }
        //        var View = [view1,view2,view3] as [Any]
        //
        //        .view1.isHidden = false
        //            .view2.isHidden = true
        //            .view3.isHidden = true
        //
        
        view.addSubview(mySegmentControl)
        self.view.addSubview(textFieldOne)
        self.view.addSubview(textFieldTwo)
        self.view.addSubview(yesButton)
        self.view.addSubview(noButton)
        self.view.addSubview(imageViewOne)
        self.view.addSubview(imageViewTwo)
        
        textFieldOne.isHidden = true
        textFieldTwo.isHidden = true
        imageViewOne.isHidden = true
        imageViewTwo.isHidden = true
        yesButton.isHidden = true
        noButton.isHidden = true
    }
    
    @objc func selectedValue(mySegmentControl: UISegmentedControl ) {
        switch mySegmentControl.selectedSegmentIndex {
        case 0:
            //первый сегмент — зелёная view с двумя текстовыми полями;
            self.view.backgroundColor = UIColor.green
            textFieldOne.isHidden = false
            textFieldTwo.isHidden = false
            imageViewOne.isHidden = true
            imageViewTwo.isHidden = true
            yesButton.isHidden = true
            noButton.isHidden = true
        case 1:
            //второй сегмент — синяя view с двумя кнопками;
            self.view.backgroundColor = UIColor.blue
            yesButton.isHidden = false
            noButton.isHidden = false
            textFieldOne.isHidden = true
            textFieldTwo.isHidden = true
            imageViewOne.isHidden = true
            imageViewTwo.isHidden = true
        case 2:
            //третий сегмент — фиолетовая view с двумя картинками.
            self.view.backgroundColor = UIColor.systemIndigo
            imageViewOne.isHidden = false
            imageViewTwo.isHidden = false
            textFieldOne.isHidden = true
            textFieldTwo.isHidden = true
            yesButton.isHidden = true
            noButton.isHidden = true
        default:
            break
        }
    }
}
