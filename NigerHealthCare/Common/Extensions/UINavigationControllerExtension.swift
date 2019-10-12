//
//  UINavigationControllerExtension.swift
//  CrossPatient
//
//  Created by Abhayam Rastogi on 20/02/17.
//  Copyright © 2017 RoundGlass Partners. All rights reserved.
//

import UIKit

extension UINavigationController{
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
    func isNavigationStackContainsController<T>(anyClass:T.Type) -> Bool  {
        for  viewController in (self.viewControllers) {
            if generic(parameter: viewController, type: anyClass) {
                return true
            }
        }
        return false
    }
    
    func isNavigationContainsController<T>(anyClass:T.Type) ->  AnyObject? {
        for  viewController in (self.viewControllers) {
            if generic(parameter: viewController, type: anyClass) {
                return viewController
            }
        }
        return nil
    }
    
    func generic<T>(parameter: AnyObject, type: T.Type) -> Bool {
        if parameter is T {
            return true
        } else {
            return false
        }
    }
    
}
