//
//  ViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeGreenButton() {
        performSegue(withIdentifier: "ShowGreen", sender: nil)
    }
    
    @IBAction func changeBlueButton() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "BlueController")
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func changeRedButton() {
        performSegue(withIdentifier: "ShowRed", sender: nil)
    }
}

