//
//  HugeSemiBoldLabel.swift
//  Reach
//
//  Created by Pranjay Arya on 24/09/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

class HugeSemiBoldLabel: BaseLabel {
    
    override func setup() {
        super.setup()
        self.font = Theme.Font.semiBold(FontSize.Huge.rawValue)
    }
}
