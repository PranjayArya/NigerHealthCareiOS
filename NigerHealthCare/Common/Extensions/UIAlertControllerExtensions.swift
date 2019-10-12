//
//  UIAlertControllerExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 25/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

extension UIAlertAction {
    /// Action types most commonly used
    public enum ActionType {
        ///Ok Option
        case ok
        /// Default Cancel Option
        case cancel
        /// Destructive action with custom title
        case destructive(String)
        /// Custom action with title and style
        case custom(String, UIAlertActionStyle)
        
        /**
         Creates the action instance for UIAlertController
         
         - parameter handler: Call Back function
         - returns UIAlertAction Instance
         */
        public func action(handler: ((String) -> Void)? = nil) -> UIAlertAction {
            //Default value
            var actionStyle = UIAlertActionStyle.default
            var title = ""
            // Action configuration based on the action type
            switch self {
                
            case .cancel:
                actionStyle = .cancel
                title = "Cancel"
                
            case .destructive(let optionTitle):
                title = optionTitle
                actionStyle = .destructive
                
            case .custom(let optionTitle, let style):
                title = optionTitle
                actionStyle = style
                
            default:
                title = "OK"
            }
            //Creating UIAlertAction instance
            return UIAlertAction(title:title, style:actionStyle) { nativeAction in
                if let handler = handler {
                    handler(title)
                }
            }
            
        }
    }
}

extension UIAlertController {
    /**
     Creates the alert view controller using the actions specified
     
     - parameter title:  Title of the alert.
     - parameter message: Alert message body.
     - parameter actions: Variable numbre of actions as an Array of actionType values.
     - parameter style: UIAlertControllerStyle enum value
     - parameter handler: Handler block/closure for the clicked option.
     
     */
    convenience init(title: String,
                     message: String,
                     actions: UIAlertAction.ActionType?...,
        style: UIAlertControllerStyle = .alert,
        handler: ((String) -> Swift.Void)? = nil) {
        
        //initialize the contoller (self) instance
        self.init(title: title, message: message, preferredStyle: style)
        
        if actions.isEmpty {
            addAction(UIAlertAction.ActionType.ok.action(handler: handler))
        } else {
            //Fetching actions specidied by the user and adding actions accordingly
            for actionType in actions {
                addAction((actionType?.action(handler: handler))!)
            }
        }
        
    }
}
