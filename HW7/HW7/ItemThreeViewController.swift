//
//  ItemThreeViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

class ItemThreeViewController: UIViewController {
    
    var subView: EmbedViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EmbedViewController, segue.identifier == "embedShow"{
            vc.supView = self
            self.subView = vc
        }
    }
    
    @IBAction func transitionButton(_ sender: UIButton) {
        guard let color = ColorPallete(rawValue: sender.tag) else { return }
        self.subView?.view.backgroundColor = color.rgb
    }
}

