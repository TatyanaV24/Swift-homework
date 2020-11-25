//
//  BonusViewController.swift
//  HW8
//
//  Created by Татьяна Васильченко on 25.11.2020.
//

import UIKit

class BonusViewController: UIViewController {
    
    let controlPanel = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controlPanel.barStyle = .default
        controlPanel.isTranslucent = true
        controlPanel.backgroundColor = UIColor.gray
        controlPanel.tintColor = UIColor.black
        controlPanel.sizeToFit()
        controlPanel.frame = CGRect(x: 0, y: 40, width: 414, height: 40)
        let oneBarButton = UIBarButtonItem(title: "1", style: .done, target: self, action: #selector(changeView(sender:)))
        let twoBarButton = UIBarButtonItem(title: "2", style: .done, target: self, action: #selector(changeView(sender:)))
        let threeBarButton = UIBarButtonItem(title: "3", style: .done, target: self, action: #selector(changeView(sender:)))
        oneBarButton.width = CGFloat(138)
        twoBarButton.width = CGFloat(138)
        threeBarButton.width = CGFloat(138)
        controlPanel.setItems([oneBarButton, twoBarButton,threeBarButton], animated: false)
        view.addSubview(controlPanel)
    }
    
    @objc func changeView(sender: UIBarButtonItem) {
        if sender.isEnabled == true {
            sender.tintColor = UIColor.blue
        }
        let greenViewController = GreenViewController()
        let yellowViewController = YellowViewController()
        switch sender.title {
        case "1":
            add(greenViewController)
            yellowViewController.remove()
        case "2":
            add(yellowViewController)
            greenViewController.remove()
        case "3":
            add(greenViewController)
            add(yellowViewController)
        default:
            break
        }
    }
}
extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func remove(){
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
