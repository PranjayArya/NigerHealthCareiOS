//
//  DoubleExtensions.swift
//  Reach
//
//  Created by Abhayam Rastogi on 12/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import UIKit

extension Double {
    var cleanValue: String {
        return String(format: "%g", self)
    }
    
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    /// RG: Converts Double to Float
    public func toFloat() -> Float {
        return Float(self)
    }
    
    /// RG: Converts Double to Int
    public func toInt() -> Int {
        return Int(self)
    }
    
}
