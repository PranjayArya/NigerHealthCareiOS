//
//  Button.swift
//  Reach
//
//  Created by Abhayam Rastogi on 30/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class Button: UIButton {

    var isPillShaped = false {
        didSet {
            if isPillShaped {
                layer.borderWidth = 1
                layer.cornerRadius = frame.height/2
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateView()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            updateView()
        }
    }
    
    override var state: UIControlState {
            return super.state
    }
    
    override var isEnabled: Bool {
        didSet {
            updateView()
        }
    }
    
    private var backgroundColors: [UInt : UIColor] = [:]
    private var borderColors: [UInt : UIColor] = [:]

    override func layoutSubviews() {
        super.layoutSubviews()

        if isPillShaped {
            layer.cornerRadius = frame.height / 2
        }
    }
    
    
    func setBackgroundColor(_ color: UIColor?, for state: UIControlState) {
        if backgroundColors.count == 0 {
            backgroundColors[UIControlState.normal.rawValue] = self.backgroundColor
        }
        
        backgroundColors[state.rawValue] = color

        if self.state == state {
            backgroundColor = color
        }
    }
    
    func setBorderColor(_ color: UIColor, forState state: UIControlState) {
        if borderColors.count == 0, let normalBorderColor =  layer.borderColor {
            borderColors[UIControlState.normal.rawValue] = UIColor(cgColor: normalBorderColor)
        }
        
        borderColors[state.rawValue] = color
        
        if self.state == state {
            layer.borderColor = color.cgColor
        }
    }
    
    private func updateView() {
        if let backgroundColor = backgroundColors[state.rawValue] {
            self.backgroundColor = backgroundColor
        } else if let normalBackgroundColor = backgroundColors[UIControlState.normal.rawValue] {
            self.backgroundColor = normalBackgroundColor
        }
        
        if let borderColor = borderColors[state.rawValue] {
            self.layer.borderColor = borderColor.cgColor
        } else if let normalBorderColor = borderColors[UIControlState.normal.rawValue] {
            self.layer.borderColor = normalBorderColor.cgColor
        }
    }
}

extension UIButton {
    func addSpacing(_ space: CGFloat, afterImage: CGFloat) {
        let left = space + afterImage
        let right = space
        contentEdgeInsets = UIEdgeInsets(top: 0, left: left, bottom: 0, right: right)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -afterImage * 2, bottom: 0, right: 0)
    }
}
