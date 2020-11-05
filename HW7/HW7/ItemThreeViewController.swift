//
//  ItemThreeViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

class ItemThreeViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? EmbedViewController, segue.identifier == "embedShow"{
            vc.delegate = self
            
        }
    }
    
    @IBAction func colorGreenButton() {
        (children[0] as? EmbedViewController)?.view.backgroundColor = UIColor.green
    }
    
    
    @IBAction func colorYellowButton() {
        (children[0] as? EmbedViewController)?.view.backgroundColor = UIColor.yellow
    }
    
    @IBAction func colorPurpleButton() {
        (children[0] as? EmbedViewController)?.view.backgroundColor = UIColor.purple
    }
}
extension ItemThreeViewController: ColorDelegate {
    func didPickColor(color: UIColor){
        self.dismiss(animated: true, completion: nil)
        self.view.backgroundColor = color
    }
}
