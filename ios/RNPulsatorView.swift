//
//  RNPulsatorView.swift
//  RNPReactNativePulsator
//
//  Created by Cüneyt Aliustaoğlu on 14/01/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import UIKit
import Pulsator

class RNPulsatorView: RCTView {
    lazy var pulsator: Pulsator = {
        let pulsator = Pulsator()
        return pulsator
    }()
    @objc var color: NSString = "" {
        didSet{
            pulsator.backgroundColor = hexStringToCGColor(hex: color as String)
        }
    }
    
    @objc var animationDuration: NSNumber = 0 {
        didSet{
            pulsator.animationDuration = TimeInterval(truncating: animationDuration)
        }
    }
    
    @objc var pulseInterval: NSNumber = 0 {
        didSet{
            pulsator.pulseInterval = TimeInterval(truncating: pulseInterval)
        }
    }
    
    @objc var repeatCount: NSNumber = 0 {
        didSet{
            pulsator.repeatCount = Float(truncating: repeatCount)
        }
    }
    
    @objc var numPulse: NSNumber = 0 {
        didSet{
            pulsator.numPulse = Int(truncating: numPulse)
        }
    }
    
    @objc var radius: NSNumber = 0 {
        didSet{
            pulsator.radius = CGFloat(truncating: radius)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let x = bounds.size.width / 2
        let y = bounds.size.height / 2
        pulsator.position = CGPoint(x: x, y: y)
        layer.addSublayer(pulsator)
        self.pulsator.start()
    }
    
    func hexStringToCGColor (hex:String) -> CGColor {
        return hexStringToUIColor(hex: hex).cgColor
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
