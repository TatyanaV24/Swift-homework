//
//  SegmentView.swift
//  HW 11
//
//  Created by Татьяна Васильченко on 15.02.2021.
//

import UIKit

protocol SegmentViewDelegate: NSObjectProtocol {
    func segmentView(_ segmentView: SegmentView)
}

@IBDesignable
class SegmentView: UIView {
    weak var delegate: SegmentViewDelegate?
    var buttons = [UIButton]()
    var buttonTitles:[String]!
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
    var commaSeparatedButtonTitles: String = "1,2" {
        didSet {
            updateSegments()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .lightGray {
        didSet {
            buttons.forEach {
                $0.setTitleColor(textColor, for: .normal)
            }
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
    var selectorTextColor: UIColor = .white{
        didSet {
            buttons.forEach {
                $0.setTitleColor(selectorTextColor, for: .selected)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateSegments()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateSegments() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        
        buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.setTitleColor(selectorTextColor, for: .selected)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        addSubview(selector)
        
        sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        addSubview(sv)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
        
        let selectorWidth = frame.width / CGFloat( buttonTitles.count)
        selector.frame = CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height)
        selector.layer.cornerRadius = frame.height / 2
        
        sv.frame = bounds
    }
    
    @objc func buttonTapped(button: UIButton) {
        for (buttonIndex,btn) in buttons.enumerated() {
            if btn == button {
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
                delegate?.segmentView(self)
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                button.isSelected = true
            } else {
                btn.isSelected = false
            }
        }
    }
}
