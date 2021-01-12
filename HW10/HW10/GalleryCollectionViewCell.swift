//
//  GalleryCollectionViewCell.swift
//  HW10
//
//  Created by Татьяна Васильченко on 16.12.2020.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    var menu: Menu? {
        didSet{
            discountLabel.text = menu?.discount
            priceLabel.text = menu?.price
            nameLabel.text = menu?.name
            percentLabel.text = menu?.percent
            if let image = menu?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }
}
