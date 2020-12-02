//
//  ViewController.swift
//  HW8
//
//  Created by Татьяна Васильченко on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let catsImage = ["1", "2","3","4","5","6","7","8","9","10"]
    var index = 0
    
    @IBOutlet weak var changeImageView: UIImageView!
    
    @IBAction func previousButton(_ sender: UIButton) {
        self.index = self.index == 0 ? self.catsImage.count - 1 : self.index - 1
        self.changeImageView.image = UIImage(named:catsImage[index])
    }
    @IBAction func nextButton(_ sender: UIButton) {
        self.index = self.index == self.catsImage.count-1 ? 0 : self.index + 1
        self.changeImageView.image = UIImage(named:catsImage[index])
    }
}
