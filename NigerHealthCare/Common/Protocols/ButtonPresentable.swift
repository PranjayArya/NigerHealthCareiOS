//
//  ButtonPresentable.swift
//  Blossom
//
//  Created by Abhayam Rastogi on 03/06/17.
//  Copyright © 2017 RoundGlass. All rights reserved.
//

import UIKit

protocol ButtonPresentable {
    //Title
    var buttonTitle:String {get}
    
    //Color
    var buttonBackgroundColor: UIColor { get }
    var buttonBorderColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
    
    //Font
    var buttonFont: UIFont { get }
    
    //Custom
    var buttonBorderWidth: CGFloat { get }
    var buttonCornerRadius: CGFloat { get }
    
}

extension ButtonPresentable {
    
    var buttonTitle:String {return ""}

    
    var buttonBackgroundColor: UIColor {
        return UIColor.clear
    }
    
    var buttonBorderColor: UIColor {
        return UIColor.clear
    }
    
    var buttonTitleColor: UIColor {
        return .black
    }
    
    var buttonFont: UIFont {
        return .systemFont(ofSize: 14)
    }
    
    var buttonBorderWidth: CGFloat {
        return 0
    }
    
    var buttonCornerRadius: CGFloat {
        return 0
    }
    
}
