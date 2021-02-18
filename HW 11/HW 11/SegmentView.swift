//
//  SegmentView.swift
//  HW 11
//
//  Created by Татьяна Васильченко on 15.02.2021.
//

import UIKit

protocol SegmentViewDelegate {
    func change(to index: Int)
}

@IBDesignable
class SegmentView: UIView {
   
    var buttons = [UIButton]()
    var buttonTitles:[String]!
    var delegate: SegmentViewDelegate?
    var selectedIndex: Int = 0
    var sv = UIStackView()
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable
    var commaSeparatedButtonTitles: String = ""
    
    @IBInspectable
    var textColor: UIColor = .lightGray {
        didSet {
            createButton()
        }
    }
    
    private var selector = UIView(frame: .zero)
    
    @IBInspectable
    var selectorColor: UIColor = .darkGray {
        didSet {
            selector.backgroundColor = selectorColor
        }
    }
    
    @IBInspectable
    var selectorTextColor: UIColor = .white
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           
        addSubview(selector)
       }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
        let selectorWidth = frame.width / CGFloat( buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height / 2
        updateView()
        
    }
    
    @objc func buttonTapped(button: UIButton) {
        for (buttonIndex,btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == button {
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.change(to: selectedIndex)
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
}
extension SegmentView {
    func updateView() {
        createButton()
        configStackView()
    }
    private func configStackView() {
        sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        addSubview(sv)
        NSLayoutConstraint.activate([
                    sv.topAnchor.constraint(equalTo: self.topAnchor),
                    sv.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                    sv.leftAnchor.constraint(equalTo: self.leftAnchor),
                    sv.rightAnchor.constraint(equalTo: self.rightAnchor)
                ])
    }
    
    private func createButton() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        
        buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
}
