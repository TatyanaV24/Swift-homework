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
    var coordinateX = 0
    var coordinateY = 0
    var stepY = 0
    var definitionOfPositonImage = 0
    let catsImage = [UIImage(named:"1"), UIImage(named:"2"),UIImage(named:"3"),UIImage(named:"4")]
    let catsName = ["Funny cat","Cute cat", "Smile rabbit", "Happy cat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...catsImage.count - 1 {
            if i % 2 == 0 && definitionOfPositonImage % 2 == 0  {
                coordinateX = 15
                stepY += 1
            } else {
                coordinateX = 220
            }
            definitionOfPositonImage += 4
            coordinateY = stepY * 200
            
            let oneView = UIView(frame: CGRect(x: coordinateX, y:coordinateY, width: 174, height: 275))
            oneView.backgroundColor = UIColor.systemGray6
            let oneImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 174, height: 245))
            let oneLabel = UILabel(frame: CGRect(x: 0, y: 245, width: 174, height: 30))
            let modelCat = Cat(icon: catsImage[i]!, name: catsName[1])
            oneImage.image = modelCat.icon
            oneLabel.text = modelCat.name
            
            if i == 0 || i == 1 {
                oneView.frame = CGRect(x: coordinateX, y:56, width: 174, height: 275)
            } else {
                oneView.frame = CGRect(x: coordinateX, y:coordinateY, width: 174, height: 275)
            }
            view.addSubview(oneView)
            oneView.addSubview(oneImage)
            oneView.addSubview(oneLabel)
        }
    }
}
