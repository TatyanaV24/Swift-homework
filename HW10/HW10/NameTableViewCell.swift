//
//  NameTableViewCell.swift
//  HW10
//
//  Created by Татьяна Васильченко on 18.12.2020.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var SwitchButton: UISwitch!
    
    var firstCell: FirstCell? {
        didSet {
            nameLabel.text = firstCell?.tuning
            if let image = firstCell?.iconImage {
                iconImage.image = UIImage(named: image)
            }
        }
    }
}

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var secondCell: SecondCell? {
        didSet {
            nameLabel.text = secondCell?.tuning
            if let image = secondCell?.iconImage {
                iconImage.image = UIImage(named: image)
            }
        }
    }
}

class ThirdTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var thirdCell: ThirdCell? {
        didSet {
            nameLabel.text = thirdCell?.tuning
            if let image = thirdCell?.iconImage {
                iconImage.image = UIImage(named: image)
            }
        }
    }
}

