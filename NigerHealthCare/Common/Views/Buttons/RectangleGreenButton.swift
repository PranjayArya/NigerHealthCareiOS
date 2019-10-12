//
//  RectangleGreenButton.swift
//  Reach
//
//  Created by DelTen Obino on 22/09/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class RectangleGreenButton: RectangleButton {
    
    // MARK: - Constants
    let buttonBackgroundColor: UIColor = Colors.greenyBlue.color
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
