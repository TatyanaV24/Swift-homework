//
//  ViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var subdView: ViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController, segue.identifier == "showBlue", segue.identifier == "showGreen", segue.identifier == "showRed" {
            self.subdView = vc
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let color = ColorPallete(rawValue: sender.tag) else { return }
        self.subdView?.view.backgroundColor = color.rgb
        dismiss(animated: true)
    }
}

