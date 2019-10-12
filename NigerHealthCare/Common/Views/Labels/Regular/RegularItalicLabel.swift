//
//  RegularItalicLabel.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 21/07/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

class RegularItalicLabel: BaseLabel {

    override func setup() {
        super.setup()
        self.font = Theme.Font.regularItalic(FontSize.Regular.rawValue)
    }

}
