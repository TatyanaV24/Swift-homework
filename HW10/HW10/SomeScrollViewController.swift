//
//  SomeScrollViewController.swift
//  HW10
//
//  Created by Татьяна Васильченко on 03.02.2021.
//

import UIKit

class SomeScrollViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var allScroll: UIScrollView!
    @IBOutlet weak var burgCollection: UICollectionView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var takeAwayButton: UIButton!
    var burImage = ["ап", "кф", "О'нил", "пб"].compactMap { UIImage(named: $0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        burgCollection.delegate = self
        burgCollection.dataSource = self
        
        menuButton.layer.borderWidth = 2.0
        menuButton.layer.borderColor = UIColor.systemGreen.cgColor
        menuButton.layer.cornerRadius = 8.0
        takeAwayButton.layer.borderWidth = 2.0
        takeAwayButton.layer.borderColor = UIColor.systemGreen.cgColor
        takeAwayButton.layer.cornerRadius = 8.0
        createButton.layer.cornerRadius = 8.0
 
}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        burImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BurgerCollectionViewCell {
            cell.burger.image = burImage[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}
extension SomeScrollViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = burgCollection.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
}
