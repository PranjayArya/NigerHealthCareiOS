//
//  DescriptionLabelPresentable.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 05/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

protocol DescriptionLabelPresentable {
    
    //Description
    var description:String {get}
    
    //Color
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    
    //Font
    var textFont: UIFont { get }
    
    //Custom
    var numberOfLines : Int { get }
    var lineBreakMode : NSLineBreakMode { get }
}

extension DescriptionLabelPresentable {
    
    var backgroundColor : UIColor {
        return UIColor.white
    }
    
    var textColor: UIColor {
        return UIColor.black
    }
    
    var textFont : UIFont {
        return UIFont.gibsonFont(type: .Regular, size: .Regular)
    }
    var numberOfLines: Int {
        return 0
    }
    
    var lineBreakMode : NSLineBreakMode {
        return NSLineBreakMode.byTruncatingTail
    }
    
}
