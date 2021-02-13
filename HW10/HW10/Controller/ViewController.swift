//
//  ViewController.swift
//  HW10
//
//  Created by Татьяна Васильченко on 16.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectioView: UICollectionView!
    
    let itemMenu = [
        Menu(imageName: "1", price: "5 000 руб.", discount: "3 500 руб", name: "Котик Тимоха в желтой толстовке", percent: "- 30 %"),
        Menu(imageName: "2", price: "4 300 руб.", discount: "6 500 руб", name: "Котик-сплюшка в колпаке", percent: "- 35 %"),
        Menu(imageName: "3", price: "2 000 руб.", discount: "4 000 руб", name: "Зайчик в зеленом платье", percent: "- 50 %"),
        Menu(imageName: "4", price: "1 700 руб.", discount: "6 500 руб", name: "Котик - комбинезон в полоску", percent: "- 75 %"),
        Menu(imageName: "5", price: "4 800 руб.", discount: "6 500 руб", name: "Зайчик - платье в горошек", percent: "- 25 %"),
        Menu(imageName: "8", price: "1 500 руб.", discount: "3 000 руб", name: "Котик малыш", percent: "- 50 %")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.dataSource = self
        collectioView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width / 2
        return CGSize(width: w, height: w)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenu.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as? GalleryCollectionViewCell {
            itemCell.menu = itemMenu[indexPath.row]
            
            return itemCell
        }
        return UICollectionViewCell()
    }
    
}
