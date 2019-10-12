//
//  ExtraSmallSemiBoldLabel.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 01/04/17.
//  Copyright © 2017 Round Glass. All rights reserved.
//

import UIKit

class ExtraSmallSemiBoldLabel: BaseLabel {

    override func setup() {
        super.setup()
            self.font = Theme.Font.semiBold(FontSize.ExSmall.rawValue)
    }
}
