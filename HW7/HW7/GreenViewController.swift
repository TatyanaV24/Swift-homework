//
//  GreenViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

class GreenViewController: UIViewController, GreenDelegate {
    
    func changeColor(updateColor: ColorPallete) {
        view.backgroundColor = updateColor.rgb
    }
}

