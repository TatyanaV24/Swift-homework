//
//  NextTwoViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

protocol NextDelegate {
    func changeText(_text:ColorPallete)
}
class NextTwoViewController: UIViewController {
    
    var text = ""
    
    var delegate: NextDelegate?
    
    @IBOutlet weak var ChangeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChangeTextField.text = text
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let color = ColorPallete(rawValue: sender.tag) else { return }
        delegate?.changeText(_text: color)
        dismiss(animated: true)
    }
}
