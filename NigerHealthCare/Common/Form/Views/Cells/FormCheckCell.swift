//
//  FormCheckCell.swift
//  CrossPatient
//
//  Created by Abhayam Rastogi on 26/05/17.
//  Copyright © 2017 RoundGlass Partners. All rights reserved.
//

import UIKit

open class FormCheckCell: FormTitleCell {
    
    // MARK: FormBaseCell
    
    open override func configure() {
        super.configure()
        selectionStyle = .default
        accessoryType = .none
    }
    
    open override func update() {
        super.update()
        
        titleLabel.text = rowDescriptor?.title
        
        var rowValue: Bool
        if let value = rowDescriptor?.value as? Bool {
            rowValue = value
        } else {
            rowValue = false
            rowDescriptor?.value = rowValue as AnyObject
        }
        
        accessoryType = (rowValue) ? .checkmark : .none
    }
    
    open override class func formViewController(_ formViewController: FormViewController, didSelectRow selectedRow: FormBaseCell) {
        guard let row = selectedRow as? FormCheckCell else { return }
        row.check()
    }
    
    // MARK: Private interface
    
    fileprivate func check() {
        var newValue: Bool
        if let value = rowDescriptor?.value as? Bool {
            newValue = !value
        }
        else {
            newValue = true
        }
        rowDescriptor?.value = newValue as AnyObject
        update()
    }
}
