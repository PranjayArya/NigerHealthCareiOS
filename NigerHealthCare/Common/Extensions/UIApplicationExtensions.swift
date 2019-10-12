//
//  UIApplicationExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 20/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

extension UIApplication {

    /// Get the top most view controller from the base view controller; default param is UIWindow's rootViewController
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }

        return viewController
    }

}
