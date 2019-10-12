//
//  HealthHomeButton.swift
//  Reach
//
//  Created by Rahul Nagpal on 22/08/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class HealthHomeButton: BaseButton {
    
    // MARK: - Constants
    let healthHomeButtonCornerRadius: CGFloat = 4.0
    
    // MARK: Initialization methods
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //        self.cornerRadius = self.frame.size.height / 2;
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    // MARK: - Configuring default properties
    override func configureButton() {
        super.configureButton()
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)

        self.layer.cornerRadius = healthHomeButtonCornerRadius
        
        self.backgroundColor = Colors.secondary.color
        setTitleColor(Colors.white.color, for: .highlighted)
        self.clipsToBounds = true
        
    }
}

