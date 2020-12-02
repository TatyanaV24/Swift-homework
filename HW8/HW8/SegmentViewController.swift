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
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    
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
        self.imageViewOne.frame = CGRect(x: 36, y: 274, width: 158, height: 164)
        imageViewOne.layer.cornerRadius = imageViewOne.frame.size.width / 2
        imageViewOne.clipsToBounds = true
        imageViewTwo.image = UIImage(named: "10")
        self.imageViewTwo.frame = CGRect(x: 218, y: 274, width: 158, height: 164)
        imageViewTwo.layer.cornerRadius = imageViewTwo.frame.size.width / 2
        imageViewTwo.clipsToBounds = true
        view.addSubview(mySegmentControl)
        view1.addSubview(textFieldOne)
        view1.addSubview(textFieldTwo)
        view2.addSubview(yesButton)
        view2.addSubview(noButton)
        view3.addSubview(imageViewOne)
        view3.addSubview(imageViewTwo)
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
    }
    @objc func selectedValue(mySegmentControl: UISegmentedControl ) {
        for (index, view) in [view1, view2, view3].enumerated() {
            view.isHidden = index != mySegmentControl.selectedSegmentIndex
        }
        view.backgroundColor = mySegmentControl.selectedSegmentIndex == 0 ? UIColor.green : (mySegmentControl.selectedSegmentIndex == 1) ? UIColor.blue :  UIColor.systemIndigo
    }
}
