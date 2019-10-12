//
//  FormButtonCell.swift
//  CrossPatient
//
//  Created by Abhayam Rastogi on 26/05/17.
//  Copyright © 2017 RoundGlass Partners. All rights reserved.
//

import UIKit

class FormButtonCell: FormTitleCell {
    
    // MARK: FormBaseCell
    
    open override func configure() {
        super.configure()
        titleLabel.textAlignment = .center
    }
    
    open override func update() {
        super.update()
        titleLabel.text = rowDescriptor?.title
    }
}
