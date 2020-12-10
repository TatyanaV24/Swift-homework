//
//  ItemFourViewController.swift
//  HW9
//
//  Created by Татьяна Васильченко on 08.12.2020.
//

import UIKit

class ItemFourViewController: UIViewController {
    
    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelFrame = CGRect(x: 0, y: 0, width: 200, height: 50)
        myLabel.frame = labelFrame
        myLabel.numberOfLines = 1
        myLabel.text = "Мечты всегда сбываются. Надо просто верить."
        myLabel.backgroundColor = UIColor.systemGray6
        myLabel.font = UIFont.boldSystemFont(ofSize: 14)
        myLabel.center = self.view.center
        view.addSubview(myLabel)
    }
    
    @IBAction func hideButton(_ sender: UIButton) {
        if myLabel.numberOfLines == 1 {
            myLabel.numberOfLines = 5
        } else {
            myLabel.numberOfLines = 1
        }
    }
}
