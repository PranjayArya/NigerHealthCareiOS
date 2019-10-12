//
//  Theme.swift
//  Reach
//
//  Created by Abhayam Rastogi on 15/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

enum Theme: Int {
    case `default`, dark, reach, white, whiteNoDivider, clear

    /*
     barTintColor attribute change the background color of the navigation bar
     */
    var barTintColor: UIColor {
        switch self {
        case .default:
            return Colors.secondary.color
        case .dark:
            return Colors.darkBlack.color
        case .reach:
            return Colors.secondary.color
        case .white:
            return Colors.white.color
        case .whiteNoDivider:
            return Colors.white.color
        case .clear:
            return Colors.clear.color
        }
    }
    
    /*
     tintColor attribute affect to the color of the
     1. back indicator image
     2. button titles
     3. button images
     */
    
    var tintColor: UIColor {
        switch self {
        case .default:
            return Colors.secondary.color
        case .dark:
            return Colors.darkBlack.color
        case .reach:
            return Colors.white.color
        case .white, .whiteNoDivider:
            return Colors.secondary.color
        case .clear:
            return Colors.secondary.color
        }
    }

    var titleColor: UIColor {
        switch self {
        case .default:
            return Colors.secondary.color
        case .dark:
            return Colors.white.color
        case .reach:
            return Colors.white.color
        case .white:
            return Colors.secondary.color
        case .whiteNoDivider:
            return Colors.secondary.color
        case .clear:
            return Colors.secondary.color
        }
    }

    var barStyle: UIBarStyle {
        switch self {
        case .default, .reach, .white, .whiteNoDivider, .clear:
            return .default
        case .dark:
            return .black
        }
    }

    var showNavigationBarShadow: Bool {
        switch self {
        case .reach, .white, .default:
            return true
        case .whiteNoDivider, .clear, .dark:
            return false
        }
    }

    var navigationBackgroundImage: UIImage? {
        return UIImage(named: "navBackground")
    }
    
    var navigationBackgroundTransparentImage: UIImage? {
        return UIImage(named: "navBackgroundTransparent")
    }

    var navigationBarBackgroundColor: UIColor? {
        switch self {
        case .default:
            return Colors.secondary.color
        case .dark:
            return Colors.darkBlack.color
        case .reach:
            return UIColor(r: 232, g: 236, b: 242)
        case .white, .whiteNoDivider:
            return Colors.white.color
        case .clear:
            return Colors.clear.color
        }
    }

    var tabBarTintColor: UIColor {
        return Colors.primary.color
    }

    var tabBarBarBackgroundColor: UIColor? {
        switch self {
        case .dark:
            return UIColor(white: 0.8, alpha: 1.0)
        case .default, .reach, .white, .whiteNoDivider, .clear:
            return Colors.white.color
        }
    }

    var toolBarBarBackgroundColor: UIColor? {
        switch self {
        case .dark:
            return UIColor(white: 0.8, alpha: 1.0)
        case .reach:
            return .white
        case .default, .white, .whiteNoDivider, .clear:
            return Colors.secondary.color
        }
    }

    var toolBarBarTintColor: UIColor {
        switch self {
        case .dark:
            return UIColor(white: 0.8, alpha: 1.0)
        case .reach:
            return .white
        case .default, .white, .whiteNoDivider, .clear:
            return Colors.secondary.color
        }
    }

    var tabBarBackgroundImage: UIImage? {
        return  nil
    }

    struct Font {
        static func light(_ size: CGFloat) -> UIFont {
            return UIFont.gibsonFont(type: .Light, size: size)
        }

        static func regular(_ size: CGFloat) -> UIFont {
            return UIFont.gibsonFont(type: .Regular, size: size)
        }

        static func medium(_ size: CGFloat) -> UIFont {
            return UIFont.gibsonFont(type: .Medium, size: size)
        }
        static func semiBold(_ size: CGFloat) -> UIFont {
            return UIFont.gibsonFont(type: .SemiBold, size: size)
        }

        static func bold(_ size: CGFloat) -> UIFont {
            return UIFont.gibsonFont(type: .Bold, size: size)
        }

        static func lightItalic(_ size: CGFloat) -> UIFont {
            return UIFont.gibsonFont(type: .LightItalic, size: size)
        }

        static func regularItalic(_ size: CGFloat) -> UIFont {
            return UIFont.gibsonFont(type: .RegularItalic, size: size)
        }

        static func boldItalic(_ size: CGFloat) -> UIFont {
            return UIFont.gibsonFont(type: .BoldItalic, size: size)
        }
    }
    
}

let selectedThemeKey = "SelectedTheme"

struct ThemeManager {

    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: selectedThemeKey) as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .default
        }
    }

    static func applyTheme(theme: Theme) {
        
        UserDefaults.standard.setValue(theme.rawValue, forKey: selectedThemeKey)
        UserDefaults.standard.synchronize()

        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = Theme.default.tintColor

        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back")
        if #available(iOS 11.0, *) {
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: theme.titleColor]
        }

        UITabBar.appearance().barStyle = theme.barStyle
        UITabBar.appearance().backgroundImage = theme.tabBarBackgroundImage
        UITabBar.appearance().backgroundColor = Colors.white.color
        UITabBar.appearance().tintColor = theme.tabBarTintColor
        UITabBar.appearance().backgroundColor = theme.tabBarBarBackgroundColor
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)


        UIToolbar.appearance().backgroundColor = UIColor.clear
        UIToolbar.appearance().tintColor = theme.toolBarBarTintColor
        UIToolbar.appearance().setBackgroundImage(UIImage(),
                                        forToolbarPosition: UIBarPosition.any,
                                        barMetrics: UIBarMetrics.default)
      // UIToolbar.appearance().setShadowImage(UIImage(), forToolbarPosition: UIBarPosition.any)

        let controlBackground = UIImage(named: "controlBackground")?
            .withRenderingMode(.alwaysTemplate)
            .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        let controlSelectedBackground = UIImage(named: "controlSelectedBackground")?
            .withRenderingMode(.alwaysTemplate)
            .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))

        let segmentedControlAppearance = UISegmentedControl.appearance()
        segmentedControlAppearance.setBackgroundImage(controlBackground, for: .normal, barMetrics: .default)
        segmentedControlAppearance.setBackgroundImage(controlSelectedBackground, for: .selected, barMetrics: .default)

        UIStepper.appearance().setBackgroundImage(controlBackground, for: .normal)
        UIStepper.appearance().setBackgroundImage(controlBackground, for: .disabled)
        UIStepper.appearance().setBackgroundImage(controlBackground, for: .highlighted)
        UIStepper.appearance().setDecrementImage(UIImage(named: "fewerPaws"), for: .normal)
        UIStepper.appearance().setIncrementImage(UIImage(named: "morePaws"), for: .normal)

        UISlider.appearance().setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
        UISlider.appearance().setMaximumTrackImage(UIImage(named: "maximumTrack")?
            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0.0, bottom: 0, right: 6.0)), for: .normal)
        UISlider.appearance().setMinimumTrackImage(UIImage(named: "minimumTrack")?
            .withRenderingMode(.alwaysTemplate)
            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 6.0, bottom: 0, right: 0)), for: .normal)

        UISwitch.appearance().onTintColor = Colors.primary.color
        UISwitch.appearance().thumbTintColor = theme.tintColor
    }
}
