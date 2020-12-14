//
//  ViewController.swift
//  Bonus
//
//  Created by Татьяна Васильченко on 30.11.2020.
//

import UIKit

class ContainerViewController: UIViewController {
    
    private var buttonsStackView: UIStackView = UIStackView()
    private var childVCStackView: UIStackView = UIStackView()
    
    private var childs: [UIViewController] = []
    private var placeholderVC: UIViewController?
    
    func addVC(_ vc: UIViewController, buttonTitle: String) {
        assert(childs.count < 6, "Too many child view controllers: only 6 allowed")
        // Сохраняем контроллер (но не показываем), создаем кнопку, показываем кнопку.
        view.backgroundColor = UIColor.white
        childs.append(GreenViewController())
        childs.append(YellowViewController())
        let oneButton = UIButton()
        let twoButton = UIButton()
        let threeButton = UIButton()
        oneButton.frame = CGRect(x: 0, y: 40, width: 138, height: 40)
        oneButton.backgroundColor = UIColor.gray
        oneButton.setTitle("1",for: .normal)
        oneButton.addTarget(self, action: #selector(showHideContentVC(sender:)), for: .valueChanged)
        twoButton.frame = CGRect(x: 138, y: 40, width: 138, height: 40)
        twoButton.backgroundColor = UIColor.gray
        twoButton.setTitle("2",for: .normal)
        twoButton.addTarget(self, action: #selector(showHideContentVC(sender:)), for: .valueChanged)
        threeButton.frame = CGRect(x: 276, y: 40, width: 138, height: 40)
        threeButton.backgroundColor = UIColor.gray
        threeButton.setTitle("3",for: .normal)
        threeButton.addTarget(self, action: #selector(showHideContentVC(sender:)), for: .valueChanged)
        buttonsStackView.addArrangedSubview(oneButton)
        buttonsStackView.addArrangedSubview(twoButton)
        buttonsStackView.addArrangedSubview(threeButton)
        view.addSubview(buttonsStackView)
    }
    func setPlaceholder(_ vc: UIViewController) {
        // Сохраняем контроллер, который показывается в случае, если ни один контент контроллер не показан
        placeholderVC = vc
    }
    
    @objc private func showHideContentVC(sender: UIButton) {
        // Показываем или скрываем контент контроллер, который соответствует кнопке
        // Если все контент контроллеры скрыты, то показываем placeholder
        
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
