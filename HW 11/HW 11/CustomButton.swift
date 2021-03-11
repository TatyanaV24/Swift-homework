//
//  CustomButton.swift
//  HW 11
//
//  Created by Татьяна Васильченко on 15.02.2021.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet { layer.borderWidth = borderWidth}
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.green {
        didSet{ layer.borderColor = borderColor.cgColor }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 12 {
        didSet { layer.cornerRadius = cornerRadius }
    }
}
