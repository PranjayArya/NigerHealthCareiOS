//
//  UIFontExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 15/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

extension UIFont {

    public class func font(_ name: FontName, type: FontType, size: CGFloat) -> UIFont! {
        //Using type
        let fontName = name.rawValue + "-" + type.rawValue
        if let font = UIFont(name: fontName, size: size) {
            return font
        }

        //That font doens't have that type, try .None
        let fontNameNone = name.rawValue
        if let font = UIFont(name: fontNameNone, size: size) {
            return font
        }

        //That font doens't have that type, try .Regular
        let fontNameRegular = name.rawValue + "-" + "Regular"
        if let font = UIFont(name: fontNameRegular, size: size) {
            return font
        }

        return nil
    }

    public class func helveticaNeue(type: FontType, size: FontSize) -> UIFont {
        return font(.HelveticaNeue, type: type, size: size.rawValue)
    }

    public class func gibsonFont(type: FontType, size: FontSize) -> UIFont {
        return font(.Gibson, type: type, size: size.rawValue)
    }

    public class func gibsonFont(type: FontType, size: CGFloat) -> UIFont {
        return font(.Gibson, type: type, size: size)
    }
}
