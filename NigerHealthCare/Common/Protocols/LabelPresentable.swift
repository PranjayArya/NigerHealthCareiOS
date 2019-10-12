//
//  LabelPresentable.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 03/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

protocol LabelPresentable {
    
    //Text
    var labelText:String {get}
    
    //Color
    var labelBackgroundColor: UIColor { get }
    var labelTextColor: UIColor { get }
    
    //Font
    var labelTextFont: UIFont { get }
    
    //Custom
    var labelNumberOfLines : Int { get }
    var labelLineBreakMode : NSLineBreakMode { get }
    
    var labelBorderColor: UIColor {get}

    var labelBorderWidth: CGFloat {get }
    var labelCornerRadius: CGFloat {get}
}

extension LabelPresentable {
    
    var labelText:String {return ""}

    var labelBackgroundColor : UIColor {
        return UIColor.white
    }
    
    var labelTextColor: UIColor {
        return UIColor.black
    }
    
    var labelTextFont : UIFont {
        return UIFont.gibsonFont(type: .Regular, size: .Regular)
    }
    var labelNumberOfLines: Int {
        return 0
    }
    
    var labelLineBreakMode : NSLineBreakMode {
        return NSLineBreakMode.byTruncatingTail
    }
    
    var labelBorderColor : UIColor {
        return UIColor.clear
    }
    var labelBorderWidth : CGFloat {
        return 0
    }
    
    var labelCornerRadius : CGFloat {
        return 0
    }
}
