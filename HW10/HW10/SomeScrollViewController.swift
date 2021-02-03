//
//  SomeScrollViewController.swift
//  HW10
//
//  Created by Татьяна Васильченко on 03.02.2021.
//

import UIKit

class SomeScrollViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var allScroll: UIScrollView!
    @IBOutlet weak var imgScroll: UIScrollView!
    @IBOutlet weak var catImg: UIImageView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var takeAwayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.layer.borderWidth = 2.0
        menuButton.layer.borderColor = UIColor.systemGreen.cgColor
        menuButton.layer.cornerRadius = 8.0
        takeAwayButton.layer.borderWidth = 2.0
        takeAwayButton.layer.borderColor = UIColor.systemGreen.cgColor
        takeAwayButton.layer.cornerRadius = 8.0
        createButton.layer.cornerRadius = 8.0
        
        let catSize = self.catImg.frame.size
                
        var imageViewRect = CGRect(x: 0, y: 0, width: catSize.width, height: catSize.height)
        let oneImage = self.newImageViewWithImage(paramImage: UIImage(named: "1")!, paramFrame: imageViewRect)
        imgScroll.addSubview(oneImage)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let twoImage = self.newImageViewWithImage(paramImage: UIImage(named: "2")!, paramFrame: imageViewRect)
        imgScroll.addSubview(twoImage)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let threeImage = self.newImageViewWithImage(paramImage: UIImage(named: "3")!, paramFrame: imageViewRect)
        imgScroll.addSubview(threeImage)
    }
    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }
}
