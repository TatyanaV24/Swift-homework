//
//  EmbedViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

class EmbedViewController: UIViewController {
    var supView: ItemThreeViewController?
    
    @IBAction func changeBackground(_ sender: UIButton) {
        guard let color = ColorPallete(rawValue: sender.tag) else { return }
        self.supView?.view.backgroundColor = color.rgb
    }
}
