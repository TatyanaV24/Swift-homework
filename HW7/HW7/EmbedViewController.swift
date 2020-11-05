//
//  EmbedViewController.swift
//  HW7
//
//  Created by Татьяна Васильченко on 05.11.2020.
//

import UIKit

protocol ColorDelegate {
    func didPickColor(color: UIColor)
}

class EmbedViewController: UIViewController {
    
    var delegate: ColorDelegate?
    
    @IBAction func greenButton() {
        self.delegate?.didPickColor(color: .green)
    }
    
    @IBAction func yellowButton() {
        self.delegate?.didPickColor(color: .yellow)
    }
    
    @IBAction func purpleButton() {
        self.delegate?.didPickColor(color: .purple)
    }
}
