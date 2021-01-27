//
//  ScrollViewController.swift
//  HW10
//
//  Created by Татьяна Васильченко on 25.01.2021.
//

import UIKit

class ScrollViewController: UIViewController {
    
    @IBOutlet weak var collectionCatView: UICollectionView!
    
    var catsImage = ["1", "2", "3", "4"].compactMap { UIImage(named: $0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionCatView.delegate = self
        collectionCatView.dataSource = self
        //collectionCatView.horizontalScrollIndicatorInsets = self
    }
   }
extension ScrollViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CatCollectionViewCell {
        cell.img.image = catsImage[indexPath.row]
        return cell
    }
        return UICollectionViewCell()
    }
}

extension ScrollViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionCatView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
}
