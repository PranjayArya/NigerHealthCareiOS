
//
//  FormSelectorCell.swift
//  CrossPatient
//
//  Created by Abhayam Rastogi on 26/05/17.
//  Copyright © 2017 RoundGlass Partners. All rights reserved.
//

import UIKit

open class FormSelectorCell: FormValueCell {
    
    // MARK: FormBaseCell
    
    open override func update() {
        super.update()
        
        titleLabel.text = rowDescriptor?.title
        titleLabel.numberOfLines = 3
        valueLabel.numberOfLines = 3
        
        var title: String?
        if let multipleValues = rowDescriptor?.value as? [AnyObject] {
            var multipleValuesTitle = ""
            for (index, selectedValue) in multipleValues.enumerated() {
                guard let selectedValueTitle = rowDescriptor?.configuration.selection.optionTitleClosure?(selectedValue) else { continue }
                if index != 0 {
                    multipleValuesTitle += ", "
                }
                multipleValuesTitle += selectedValueTitle
            }
            title = multipleValuesTitle
        } else if let singleValue = rowDescriptor?.value {
            title = rowDescriptor?.configuration.selection.optionTitleClosure?(singleValue)
        }
        
        if let title = title , title.count > 0 {
            valueLabel.text = title
            valueLabel.textColor = UIColor.black
        } else {
            valueLabel.text = rowDescriptor?.configuration.cell.placeholder
            valueLabel.textColor = UIColor.lightGray
        }
    }
    
    open override class func formViewController(_ formViewController: FormViewController, didSelectRow selectedRow: FormBaseCell) {
        guard let row = selectedRow as? FormSelectorCell else { return }
        
        formViewController.view.endEditing(true)
        
        var selectorControllerClass: UIViewController.Type
        
        if let controllerClass = row.rowDescriptor?.configuration.selection.controllerClass as? UIViewController.Type {
            selectorControllerClass = controllerClass
        } else { // fallback to default cell class
            selectorControllerClass = FormOptionsSelectorController.self
        }
        
        let selectorController = selectorControllerClass.init()
        guard let formRowDescriptorViewController = selectorController as? FormSelector else { return }
        
        formRowDescriptorViewController.formCell = row
        formViewController.navigationController?.pushViewController(selectorController, animated: true)
    }
}
