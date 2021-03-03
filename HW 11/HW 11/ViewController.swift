//
//  ViewController.swift
//  HW 11
//
//  Created by Татьяна Васильченко on 03.03.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

}
extension ViewController: SegmentViewDelegate {
    func segmentView(_ segmentView: SegmentView) {
        print("pressed test view")
    }
}
