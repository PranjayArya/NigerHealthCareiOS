//
//  NextButton.swift
//  Reach
//
//  Created by DelTen Obino on 03/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class NextButton: RectangleButton {
    
    // MARK: - Constants
    let buttonBackgroundColor: UIColor = Colors.gunMetal.color
    let buttonTextColor: UIColor = Colors.white.color
    
    // MARK: - Configuring default properties
    override func configureButton() {
        super.configureButton()
        
        //Layer
        //Background
        self.backgroundColor = buttonBackgroundColor
        
        //title
        self.setTitleColor(buttonTextColor, for: .normal)
    }
    
}
