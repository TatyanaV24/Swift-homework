//
//  GalleryViewController.swift
//  HW8
//
//  Created by Татьяна Васильченко on 17.11.2020.
//

import UIKit
struct Cat {
    let icon: UIImage
    let name: String
}
class GalleryViewController: UIViewController {
    
    let cats = [Cat(icon: UIImage(named:"1")!, name: "Funny cat"), Cat(icon: UIImage(named:"2")!, name: "Cute cat"), Cat(icon: UIImage(named:"3")!, name: "Smile rabbit"), Cat(icon: UIImage(named:"4")!, name: "Happy cat")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for cat in cats {
            let icon = cat.icon
            let name = cat.name
            var x = 20
            var y = -250
            for (index, image) in cats.enumerated() {
                if index % 2 == 0 {
                    x = 20
                    y += 270
                } else {
                    x = 200
                }
            }
            let oneView = UIView(frame: CGRect(x: x, y: y, width: 174, height: 275))
            oneView.backgroundColor = UIColor.systemGray6
            let oneImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 174, height: 245))
            let oneLabel = UILabel(frame: CGRect(x: 0, y: 245, width: 174, height: 30))
            oneImage.image = icon
            oneLabel.text = name
            view.addSubview(oneView)
            oneView.addSubview(oneImage)
            oneView.addSubview(oneLabel)
        }
    }
}
