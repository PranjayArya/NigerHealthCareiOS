//
//  UIButtonExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 12/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC

private var activityIndicatorAssociationKey: UInt8 = 0

extension UIButton {
    var activityIndicator: UIActivityIndicatorView! {
        get {
            return objc_getAssociatedObject(self, &activityIndicatorAssociationKey) as? UIActivityIndicatorView
        }
        set(newValue) {
            objc_setAssociatedObject(self, &activityIndicatorAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func showActivityIndicator(){
        
        if (self.activityIndicator == nil) {
            self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
            self.activityIndicator.hidesWhenStopped = true
            self.activityIndicator.isUserInteractionEnabled = false
            
            OperationQueue.main.addOperation({ () -> Void in
                self.addSubview(self.activityIndicator)
                self.activityIndicator.startAnimating()
                self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                
                Constraint.pinCenterOfSubview(subview: self.activityIndicator, superView: self)
                Constraint.subviewWidth(subview: self.activityIndicator, superView: self, constant: 40)
                Constraint.subviewHeight(subview: self.activityIndicator, superView: self, constant: 40)
            })
        }
    }
    
    
    func hideActivityIndicator() {
        OperationQueue.main.addOperation({ () -> Void in
            self.activityIndicator?.stopAnimating()
        })
    }
}

