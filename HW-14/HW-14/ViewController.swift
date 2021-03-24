//
//  ViewController.swift
//  HW-14
// a) два текстовых поля для имени и фамилии, которые сохраняют введённые данные в UserDefaults, а при повторном запуске приложения показывают последние введённые строки; - https://www.youtube.com/watch?v=ufDsOtiUzyE

//  Created by Татьяна Васильченко on 22.03.2021.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = Persistance.shared.userName
        surnameTextField.text = Persistance.shared.userSurname
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        Persistance.shared.userName = nameTextField.text
        Persistance.shared.userSurname = surnameTextField.text
        //       print(Persistance.shared.userName!)
        //       print(Persistance.shared.userSurname!)
    }
}
