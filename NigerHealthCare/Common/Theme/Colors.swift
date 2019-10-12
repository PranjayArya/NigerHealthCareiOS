//
//  Color.swift
//  Reach
//
//  Created by Abhayam Rastogi on 15/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

enum Colors {

    case primary, secondary, backgroundGrey, darkBlack, white, violet, charcoal, athensGray, gray100, clear, greenyBlue, gunMetal, warmGrey, whiteTwo, paleGrey, pinkishGrey, mango, whiteFour, hippiePink, brass, onTrack, puertoRicoGreen, gurkha, black, gray, fantasy, mangoColor, green, blue, yellow, purple, lightBlue, pink, textBlueColor, textLightBlueColor, textLightestBlueColor, textGray, blueGray , darkestGray, cloudyBlue, lightGreyBlue, skyBlue,charcoalGray,darkRed, textLightestBluishColor, teal, white1, paleGrayThree, shinyBlue, lightGreen, darkSkyBlue, lightBrown, paleYellow , textYellow

    var color: UIColor {
        switch self {
        case .primary:
          return UIColor(r: 225, g: 98, b: 97)
        case .secondary:
            return UIColor(r: 91, g: 117, b: 146)
        case .backgroundGrey:
            return UIColor(r: 231, g: 237, b: 243)
        case .darkBlack:
            return UIColor.black
        case .white:
            return UIColor.white
        case .violet:
            return UIColor(r: 99, g: 73, b: 118)
        case .charcoal:
            return UIColor(r: 74, g: 74, b: 74)
        case .athensGray:
            return UIColor(r: 227, g: 230, b: 236)
        case .gray100:
            return UIColor(r: 162, g: 162, b: 162)
        case .clear:
            return UIColor.clear
        case .greenyBlue:
            return UIColor(r: 72, g: 169, b: 166)
        case .gunMetal:
            return UIColor(r: 80, g: 86, b: 99)
        case .warmGrey:
            return UIColor(r: 151, g: 151, b: 151)
        case .whiteTwo:
            return UIColor(r: 222, g: 222, b: 222)
        case .paleGrey:
            return UIColor(r: 242, g: 244, b: 249)
        case .pinkishGrey:
            return UIColor(r: 204, g: 204, b: 204)
        case .mango:
            return UIColor(r: 255, g: 178, b: 53)
        case .whiteFour:
            return UIColor(r: 242, g: 242, b: 242)
        case .hippiePink:
            return UIColor(r: 174, g: 73, b: 85)
        case .onTrack:
            return UIColor(r: 81, g: 196, b: 171)
        case .brass:
            return UIColor(r: 172, g: 165, b: 70)
        case .puertoRicoGreen:
            return UIColor(r: 75, g: 192, b: 170)
        case .gurkha:
            return UIColor(r: 160, g: 150, b: 128)
        case .gray:
            return UIColor.gray
        case .black:
            return UIColor.black
        case .fantasy:
            return UIColor(r: 241, g: 239, b: 237)
        case .mangoColor:
            return UIColor(r: 223, g: 184, b: 126)
        case .green:
            return UIColor.green
        case .blue:
            return UIColor.blue
        case .yellow:
            return UIColor.yellow
        case .purple:
            return UIColor.purple
        case .lightBlue:
            return UIColor(r: 156, g: 207, b: 248)
        case .pink:
            return UIColor(r: 242, g: 109, b: 125)
        case .textBlueColor:
            return  UIColor(r: 68, g: 86, b: 108)
        case .textLightBlueColor:
            return  UIColor(r: 171, g: 179, b: 189)
        case .textLightestBlueColor:
            return  UIColor(r: 137, g: 150, b: 166)
        case .textLightestBluishColor:
            return  UIColor(r: 211, g: 219, b: 227)
        case .textGray:
            return  UIColor(r: 64, g: 73, b: 84)
        case .cloudyBlue:
            return  UIColor(r: 215, g: 222, b: 229)
        case .blueGray:
            return UIColor(r: 138, g: 151, b: 166)
        case .darkestGray:
            return  UIColor(r: 74, g: 91, b: 109)
        case .charcoalGray:
             return  UIColor(r: 111, g: 131, b: 152)
        case .darkRed:
            return  UIColor(r: 211, g: 74, b: 91)
        case .lightGreyBlue:
            return  UIColor(r: 149, g: 215, b: 213)
        case .skyBlue:
            return  UIColor(r: 60, g: 197, b: 230)
        case .white1:
            return  UIColor(r: 247, g: 248, b: 250)
        case .teal:
            return  UIColor(r: 29, g: 159, b: 155)
        case .paleGrayThree:
            return  UIColor(r: 241, g: 245, b: 249)
        case .shinyBlue:
            return  UIColor(r: 113, g: 151, b: 194)
        case .paleYellow:
            return  UIColor(r: 238, g: 229, b: 119)
        case .lightGreen:
            return  UIColor(r: 180, g: 210, b: 164)
        case .darkSkyBlue:
            return  UIColor(r: 77, g: 131, b: 184)
        case .lightBrown:
            return  UIColor(r: 185, g: 149, b: 108)
        case .textYellow:
            return  UIColor(r: 221, g: 208, b: 46)
        }
    }
    
    func customColor(rValur:CGFloat, gValur:CGFloat, bValue:CGFloat) -> UIColor {
        return  UIColor(r: rValur, g: gValur, b: bValue)
    }
}
