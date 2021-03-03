//
//  ClockView.swift
//  HW 11
//
//  Created by Татьяна Васильченко on 15.02.2021.
//

import UIKit

@IBDesignable
class ClockView: UIView {
    
    var markerSize: CGFloat = 4
    var markerLength: CGFloat = 12
    @IBInspectable var markerColor:UIColor = UIColor.blue {
        didSet {
            for v in [topMarker, leftMarker, rightMarker, bottomMarker] {
                v.backgroundColor = markerColor
            }
        }
    }
    
    var hourLineSize: CGFloat = 6
    @IBInspectable var hourLineOffset: CGFloat = 60 {
        didSet {layoutIfNeeded()}
    }
    @IBInspectable var hourLineColor:UIColor = UIColor.black{
        didSet {hourLine.backgroundColor = hourLineColor}
    }
    
    var minuteLineSize: CGFloat = 6
    @IBInspectable var minuteLineOffset: CGFloat = 40 {
        didSet {layoutIfNeeded()}
    }
    @IBInspectable var minuteLineColor:UIColor = UIColor.green{
        didSet {minuteLine.backgroundColor = minuteLineColor}
    }
    
    var secondLineSize: CGFloat = 6
    @IBInspectable var secondLineOffset: CGFloat = 20 {
        didSet {layoutIfNeeded()}
    }
    @IBInspectable var secondLineColor: UIColor = UIColor.blue{
        didSet {secondLine.backgroundColor = secondLineColor}
    }
    var roundedViewColor: UIColor = UIColor.systemBlue
    
    @IBInspectable var hours: CGFloat = 12
    @IBInspectable var minute: CGFloat = 45
    @IBInspectable var second: CGFloat = 14
    
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    
    private let hourLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    private let roundedView = UIView()
    
    func updateViews() {
        layer.cornerRadius = frame.size.width / 2
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        let w = frame.size.width
        let h = frame.size.height
        
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerLength, y: h / 2 - markerSize, width:markerLength, height: markerSize)
        bottomMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerLength, width: markerSize, height: markerLength)
        
        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: hourLineOffset, width: hourLineSize, height: h/2 - hourLineOffset)
        minuteLine.frame = CGRect(x: w / 2 - minuteLineSize / 2, y: minuteLineOffset, width: minuteLineSize, height: h/2 - minuteLineOffset)
        secondLine.frame = CGRect(x: w / 2 - secondLineSize / 2, y: secondLineOffset, width: secondLineSize, height: h/2 - secondLineOffset)
        
        roundedView.frame = CGRect(x: w / 2 - 8, y: h / 2 - 8, width: 16, height: 16)
        roundedView.layer.cornerRadius = 8
        roundedView.backgroundColor = roundedViewColor
        updateHours()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
    }
    
    func updateHours(){
        let angleHour = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angleHour)
        
        let angleMinute = CGFloat.pi * 2 * (minute / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angleMinute)
        
        let angleSecond = CGFloat.pi * 2 * (second / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angleSecond)
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, minuteLine, secondLine, roundedView ] {
            addSubview(v)
        }
    }
}
