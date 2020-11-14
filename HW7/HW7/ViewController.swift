//
//  ViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

enum ColorPallete: Int {
    case red = 0
    case green = 1
    case blue = 2
    /*case yellow = 3
     case purple = 4*/
    
    var selectedDescription: String {
        switch self {
        case .red:
            return "красный"
        case .green:
            return "зеленый"
        case .blue:
            return "синий"
        }
    }
    
    var rgb: UIColor {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
            
        }
    }
}

protocol GreenDelegate {
    func changeColor(updateColor: ColorPallete)
}
class ViewController: UIViewController {
    
    var delegate: GreenDelegate?
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowGreen", sender: nil)
        guard let color = ColorPallete(rawValue: sender.tag) else { return }
        self.delegate?.changeColor(updateColor: color)
        dismiss(animated: true)
    }
}
