//
//  Font.swift
//  Reach
//
//  Created by Abhayam Rastogi on 15/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

// swiftlint:disable identifier_name
public enum FontType: String {
    case None = ""
    case Regular = "Regular"
    case Bold = "Bold"
    case DemiBold = "DemiBold"
    case Light = "Light"
    case UltraLight = "UltraLight"
    case Italic = "Italic"
    case Thin = "Thin"
    case Book = "Book"
    case Roman = "Roman"
    case Medium = "Medium"
    case MediumItalic = "MediumItalic"
    case CondensedMedium = "CondensedMedium"
    case CondensedExtraBold = "CondensedExtraBold"
    case SemiBold = "SemiBold"
    case BoldItalic = "BoldItalic"
    case LightItalic = "LightIt"
    case RegularItalic = "RegularIt"
    case Heavy = "Heavy"
}

public enum FontName: String {
    case HelveticaNeue
    case Helvetica
    case Futura
    case Menlo
    case Avenir
    case AvenirNext
    case Didot
    case AmericanTypewriter
    case Baskerville
    case Geneva
    case GillSans
    case SanFranciscoDisplay
    case Seravek
    case Gibson
    case ProximaNova
}

public enum FontSize: CGFloat {
    case ExSmall = 12
    case Small = 14
    case Regular = 16
    case Large = 18
    case Larger = 20
    case ExLarge = 24
    case Huge = 26
    case Jumbo = 30
    case ExtraJumbo = 36
}
