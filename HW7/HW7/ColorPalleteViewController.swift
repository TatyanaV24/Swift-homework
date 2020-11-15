//
//  ColorPalleteViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 15.11.2020.
//

import UIKit

enum ColorPallete: Int {
    case red = 0
    case green = 1
    case blue = 2
    case yellow = 3
    case purple = 4
    
    var selectedDescription: String {
        switch self {
        case .red:
            return "красный"
        case .green:
            return "зеленый"
        case .blue:
            return "синий"
        case .yellow:
            return "желтый"
        case .purple:
            return "пурпурный"
        }
    }
    
    var rgb: UIColor {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .purple:
            return .purple
        }
    }
}
