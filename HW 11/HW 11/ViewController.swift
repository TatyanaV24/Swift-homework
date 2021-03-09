//
//  ViewController.swift
//  HW 11
//
//  Created by Татьяна Васильченко on 03.03.2021.
//

import UIKit

class ViewController: UIViewController, SegmentViewDelegate {
    
    let segment = SegmentView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.delegate = self
        view.addSubview(segment)
    }
    func segmentView(sender: UIButton) {
           print("pressed segment view")
    }
}
