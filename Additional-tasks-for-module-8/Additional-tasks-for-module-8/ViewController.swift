//
//  ViewController.swift
//  Additional-tasks-for-module-8
//
//  Created by Татьяна Васильченко on 11.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var catsImage = [UIImage(named: "1")!, UIImage(named: "2")!,UIImage(named: "3")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!, UIImage(named: "8")!, UIImage(named: "9")!, UIImage(named: "10")!]
    
    @IBOutlet weak var playImageView: UIImageView!
    
    @IBAction func playButton(_ sender: UIButton) {
        playImageView.animationImages = catsImage
        playImageView.animationDuration = 3
        playImageView.startAnimating()
    }
    @IBAction func stopButton(_ sender: UIButton) {
        playImageView.stopAnimating()
    }
}
