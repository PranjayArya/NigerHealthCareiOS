//
//  HugeBoldLabel.swift
//  Reach
//
//  Created by Pranjay Arya on 24/09/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class HugeBoldLabel: BaseLabel {
    
    override func setup() {
        super.setup()
        self.font = Theme.Font.bold(FontSize.Huge.rawValue)
    }
}

