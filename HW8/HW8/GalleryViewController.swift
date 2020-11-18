//
//  GalleryViewController.swift
//  HW8
//
//  Created by Татьяна Васильченко on 17.11.2020.
//

import UIKit

class GalleryViewController: UIViewController {

    let catsImage = [UIImage(named:"1"), UIImage(named:"2"),UIImage(named:"3"),UIImage(named:"4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageLabel0 = UILabel()
        let imageLabel1 = UILabel()
        let imageLabel2 = UILabel()
        let imageLabel3 = UILabel()
        
        imageLabel0.text = "Funny cat"
        imageLabel1.text = "Cute cat"
        imageLabel2.text = "Sad cat"
        imageLabel3.text = "Good cat"
        
       // let imageLabelArr = [imageLabel0, imageLabel1, imageLabel2, imageLabel3]
        
        
 //задала размер ImageView
        let screenWidth = Double(self.view.frame.size.width)
        let imageWidth = screenWidth / 2 - 10 - 10
        let imageHeight = imageWidth * 1.5
        
 //инициализация переменных для изображения координат
        var coordinateX = 0
        var coordinateY = 0
        var stepY = 0
        var definitionOfPositonImage = 0
        
        for i in 0...catsImage.count - 1 {
           // for j in 0...imageLabelArr.count - 1 {
            if i % 2 == 0 && definitionOfPositonImage % 2 == 0  {
                
                //установить значение координаты
                coordinateX = 15
                stepY += 1
                
            } else {
                
                coordinateX = 220
                
            }
            //сдвиг картинки вниз по Y
            definitionOfPositonImage += 5
            coordinateY = stepY * 200
            
            
            let imageView = UIImageView()
            imageView.image = catsImage[i]
            var imageLabel = UILabel()
            //imageLabel = imageLabelArr[j]
            
            
            //чтобы первые две картинки не смещались по Y
            if i == 0 || i == 1 {
                
                //задание положения и размера картинки
                imageView.frame = CGRect(x: coordinateX, y: 50, width: Int(imageWidth), height: Int(imageHeight))
                
                imageLabel.frame = CGRect(x: coordinateX, y: 350, width: Int(imageWidth), height: 30)
                imageLabel.backgroundColor = UIColor.gray
                //imageLabel.text = "Funny cat's"
                
            } else {
                
                imageView.frame = CGRect(x: coordinateX, y: coordinateY, width: Int(imageWidth), height: Int(imageHeight))
                imageLabel.frame = CGRect(x: coordinateX, y: 700, width: Int(imageWidth), height: 30)
                imageLabel.backgroundColor = UIColor.gray
                //imageLabel.text = "Cute cat's"
            }
            
            view.addSubview(imageView)
            view.addSubview(imageLabel)
        }
    }
    }



