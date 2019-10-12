//
//  AcceptGreenButton.swift
//  Reach
//
//  Created by DelTen Obino on 14/08/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class AcceptButton: RectangleButton {
    
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
//        self.titleLabel?.font = UIFont.gibsonFont(type: FontType(rawValue: "Semibold")!, size: 12)
        
        // Border& Round Edge
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = buttonBackgroundColor.cgColor
        self.clipsToBounds = true
    }
    
}
