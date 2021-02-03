//
//  ViewController.swift
//  HW10
//
//  Created by Татьяна Васильченко on 16.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectioView: UICollectionView!
    
    var itemMenuArray:[Menu] = {
        var blankMenu = Menu()
        blankMenu.imageName = "1"
        blankMenu.price = "5 000 руб."
        blankMenu.discount = "3 500 руб"
        blankMenu.percent = "- 30 %"
        blankMenu.name = "Котик Тимоха в желтой толстовке"
        
        var blankMenu2 = Menu()
        blankMenu2.imageName = "2"
        blankMenu2.discount = "6 500 руб"
        blankMenu2.percent = "- 35 %"
        blankMenu2.price = "4 300 руб."
        blankMenu2.name = "Котик-сплюшка в колпаке"
        
        var blankMenu3 = Menu()
        blankMenu3.imageName = "3"
        blankMenu3.discount = "4 000 руб"
        blankMenu3.percent = "- 50 %"
        blankMenu3.price = "2 000 руб."
        blankMenu3.name = "Зайчик в зеленом платье"
        
        var blankMenu4 = Menu()
        blankMenu4.imageName = "4"
        blankMenu4.discount = "6 500 руб"
        blankMenu4.percent = "- 75 %"
        blankMenu4.price = "1 700 руб."
        blankMenu4.name = "Котик - комбинезон в полоску"
        
        var blankMenu5 = Menu()
        blankMenu5.imageName = "5"
        blankMenu5.discount = "6 500 руб"
        blankMenu5.percent = "- 25 %"
        blankMenu5.price = "4 800 руб."
        blankMenu5.name = "Зайчик - платье в горошек"
        
        var blankMenu6 = Menu()
        blankMenu6.imageName = "8"
        blankMenu6.discount = "3 000 руб"
        blankMenu6.percent = "- 50 %"
        blankMenu6.price = "1 500 руб."
        blankMenu6.name = "Котик малыш"
        
        return [blankMenu, blankMenu2, blankMenu3, blankMenu4, blankMenu5, blankMenu6]
    }()
    
    
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
        return itemMenuArray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as? GalleryCollectionViewCell {
            itemCell.menu = itemMenuArray[indexPath.row]
           
            return itemCell
        }
        return UICollectionViewCell()
    }
    
}
