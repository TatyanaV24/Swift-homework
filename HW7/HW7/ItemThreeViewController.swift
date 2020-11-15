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
        switch sender.tag {
        case 6:
            self.subView?.view.backgroundColor = UIColor.green
        case 7:
            self.subView?.view.backgroundColor = UIColor.yellow
        case 8:
            self.subView?.view.backgroundColor = UIColor.purple
        default:
            break
        }
    }
}

