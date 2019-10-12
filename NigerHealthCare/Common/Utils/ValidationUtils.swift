//
//  ValidationUtils.swift
//  Reach
//
//  Created by Abhayam Rastogi on 20/06/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

typealias ValidationResult = (isValid: Bool, info: String?)

public struct ValidationUtils {

    /// Method to validate if the given email Input String is in valid Email format.
    ///
    /// - parameter emailInputString: Email Input String.
    ///
    /// - returns: Whether the Email String is valid or not.
    public static func isValidEmail(_ emailInputString: String) -> Bool {

        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: emailInputString)
    }

    /// Method to validate if the given phone Input String is in valid Phone Number format
    ///
    /// - parameter phoneInputString: Phone Number Input String.
    ///
    /// - returns: Whether the Phone Number String is valid or not.
    public static func isValidPhoneNumber(_ phoneInputString: String) -> Bool {

        let regex = "(91)[789]\\d{9}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: phoneInputString)
    }

    /// Method to validate if the given phone Input String is in valid 10 digit Phone Number format.
    ///
    /// - parameter phoneInputString: Phone Number Input String
    ///
    /// - returns: Whether the Phone Number String is valid 10 digit number or not.
    public static func isValidTenDigitPhoneNumber(_ phoneInputString: String) -> Bool {

        let regex = "[789]\\d{9}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: phoneInputString)
    }

    /// Method to validate if the Input String is Empty or not.
    ///
    /// - parameter inputString: Input String to be Validated.
    ///
    /// - returns: Returns a bool indicating whether the field was empty or not.
    public static func isTextEmpty(_ inputString: String?) -> Bool {
        if inputString == nil {
            return true
        }
        return inputString!.isEmpty
    }

    /// Method to Show an Alert View Controller on Validation Failure.
    ///
    /// - parameter title:       Title of the Alert View Controller.
    /// - parameter error:       Error will be presented.
    /// - parameter handler:     Closure to return when alert action called.

    public static func showNoInternetAlert(target: AnyObject, handler: (() -> Void)? = nil) {
        show(error: APIError.noInternetAvailable, title: "No Internet Connection", target: target, handler: handler)
    }
    
    public static func show(error: Error, title: String, target: AnyObject, handler:(() -> Void)? = nil) {
        var errorMsg = "Something went wrong"
        if error.localizedDescription.count > 0 {
            errorMsg = error.localizedDescription
        }
        else {
            if error._code == 408 {
                errorMsg = "Check your network connection"
            }
        }
        let alert = UIAlertController(title: title, message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(_) in
            handler?()
        }))
        target.present(alert, animated: true, completion: nil)
    }

    public static func showAlertViewController(title: String, message: String, buttonTitle: String,
                                               target: AnyObject, handler:(() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default, handler: {(_) in
            handler?()
        }))
        target.present(alertController, animated: true, completion: nil)
    }
    
    public static func showAlertViewController(title: String, message: String, buttons:[String] , target: AnyObject, handler:((_ allowed:Bool)->())?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: buttons.first, style: UIAlertActionStyle.default, handler: {(action) in
            handler?(true)
        }))
        alertController.addAction(UIAlertAction(title: buttons.last, style: UIAlertActionStyle.cancel, handler: {(action) in
            handler?(false)
        }))
        target.present(alertController, animated: true, completion: nil)
    }
}
