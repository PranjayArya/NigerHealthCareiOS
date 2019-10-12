//
//  BaseTextField.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 03/04/17.
//  Copyright © 2017 Round Glass. All rights reserved.
//
    
import UIKit

class BaseTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        super.drawText(in: rect)
        self.font = UIFont.gibsonFont(type: .Regular, size: .Regular)
    }
    
}
