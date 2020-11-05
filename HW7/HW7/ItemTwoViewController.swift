//
//  ItemTwoViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

class ItemTwoViewController: UIViewController {
    var colorText = "Выбран зеленый"
    
    @IBOutlet weak var changeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLabel.text = colorText
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NextTwoViewController, segue.identifier == "showNext"{
            vc.text = changeLabel.text!
            vc.delegate = self
        }
    }
}
extension ItemTwoViewController: NextDelegate{
    func changeText(_text:String){
        changeLabel.text = "\(_text)"
    }
}
