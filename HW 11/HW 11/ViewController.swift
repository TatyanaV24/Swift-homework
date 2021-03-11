//
//  ViewController.swift
//  HW 11
//
//  Created by Татьяна Васильченко on 03.03.2021.
//

import UIKit

class ViewController: UIViewController, SegmentViewDelegate {
    
    @IBOutlet weak var segment: SegmentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.delegate = self
    }
    
    func segmentView(sender: SegmentView) {
        print("pressed segment view")
    }
}
