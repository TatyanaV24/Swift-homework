//
//  ViewController.swift
//  Bonus
//
//  Created by Татьяна Васильченко on 30.11.2020.
//

import UIKit

class ContainerViewController: UIViewController {
    let controlPanel = UIToolbar()
    let greenViewController = GreenViewController()
    let yellowViewController = YellowViewController()
    
    private var buttonsStackView: UIStackView
    private var childVCStackView: UIStackView
    
    private var childs: [UIViewController] = []
    private var placeholderVC: UIViewController?
    
    func addVC(_ vc: UIViewController, buttonTitle: String) {
        assert(childs.count < 6, "Too many child view controllers: only 6 allowed")
        // Сохраняем контроллер (но не показываем), создаем кнопку, показываем кнопку.
        controlPanel.barStyle = .default
        controlPanel.isTranslucent = true
        controlPanel.backgroundColor = UIColor.gray
        controlPanel.tintColor = UIColor.black
        controlPanel.sizeToFit()
        controlPanel.frame = CGRect(x: 0, y: 40, width: 414, height: 40)
        let oneBarButton = UIBarButtonItem(title: "1", style: .done, target: self, action: #selector(showHideContentVC(sender:)))
        let twoBarButton = UIBarButtonItem(title: "2", style: .done, target: self, action: #selector(showHideContentVC(sender:)))
        let threeBarButton = UIBarButtonItem(title: "3", style: .done, target: self, action: #selector(showHideContentVC(sender:)))
        oneBarButton.width = CGFloat(138)
        twoBarButton.width = CGFloat(138)
        threeBarButton.width = CGFloat(138)
        controlPanel.setItems([oneBarButton, twoBarButton,threeBarButton], animated: false)
        view.addSubview(controlPanel)
    }
    
    func setPlaceholder(_ vc: UIViewController) {
        // Сохраняем контроллер, который показывается в случае, если ни один контент контроллер не показан
    }
    
    @objc private func showHideContentVC(sender: UIBarButtonItem) {
        // Показываем или скрываем контент контроллер, который соответствует кнопке
        // Если все контент контроллеры скрыты, то показываем placeholder
        switch sender.title {
        case "1":
            showChildVC(greenViewController)
        //yellowViewController.hideChildVC()
        case "2":
            showChildVC(yellowViewController)
        //            greenViewController.remove()
        case "3":
            showChildVC(greenViewController)
            showChildVC(yellowViewController)
        default:
            view.backgroundColor = .gray
        }
    }
    private func showChildVC(_ childVC: UIViewController) {
        // Функция для добавления контроллера в иерархию и его показа
        addChild(childVC)
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    
    private func hideChildVC(_ childVC: UIViewController) {
        // Функция для удаления контроллера из иерархии и его скрытия
        willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
}

