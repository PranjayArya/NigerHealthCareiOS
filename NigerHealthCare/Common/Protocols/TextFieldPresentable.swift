//
//  TextFieldPresentable.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 04/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

protocol TextFieldPresentable {
    var textFieldPlaceholder: String { get }
    var textFieldFont: UIFont { get }
    var textFieldTextColor: UIColor { get }
    var textFieldTextAlignment:NSTextAlignment {get}
    var textFieldBorderStyle:UITextBorderStyle {get}
    var textFieldBackgroundColor: UIColor {get}
}


extension TextFieldPresentable {
    var textFieldPlaceholder: String { return "" }
    var textFieldFont : UIFont { return UIFont.gibsonFont(type: .Regular, size: .Regular)}
    var textFieldTextColor: UIColor { return UIColor(r: 43, g: 45, b: 60) }
    var textFieldBorderStyle:UITextBorderStyle {return .line}
    var textFieldBackgroundColor: UIColor {return UIColor.clear}
    var textFieldTextAlignment: NSTextAlignment {return NSTextAlignment.left}
}
