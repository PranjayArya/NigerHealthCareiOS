//
//  JumboSemiBoldLabel.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 27/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class JumboSemiBoldLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.semiBold(FontSize.Jumbo.rawValue)
    }
}
