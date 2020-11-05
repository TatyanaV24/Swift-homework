//
//  NextTwoViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

protocol NextDelegate {
    func changeText(_text:String)
}
class NextTwoViewController: UIViewController {

    var text = ""
    
    var delegate: NextDelegate?
    
    @IBOutlet weak var ChangeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChangeTextField.text = text
        }
    
    @IBAction func greenButton() {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        delegate?.changeText(_text: "Выбран \"зеленый цвет\"")
    }
    
    @IBAction func blueButton() {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        delegate?.changeText(_text: "Выбран \"синий цвет\"")
    }
    
    @IBAction func redButton() {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        delegate?.changeText(_text: "Выбран \"красный цвет\"")
    }
    
}
