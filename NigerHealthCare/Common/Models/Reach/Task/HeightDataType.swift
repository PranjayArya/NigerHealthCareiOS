//
//  HeightDataType.swift
//  Reach
//
//  Created by DelTen Obino on 18/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import UIKit

struct HeightDataTypeModel {
    var id = ""
    var value = ""
}

enum HeightDataType{
    
    static let DATA_TYPE = "Height:1"
    static let DEFAULT = "5.1"
    static let RES_DATA_TYPE = "Height"
    
    static let startFeet:Int = 4
    static let endFeet:Int = 7
    
    static func getFeetHeightIds() -> [String] {
        var keys = [String]()
        var i = startFeet
        while i < endFeet {
            for j in 0..<12 {
                keys.append("\(i).\(j)")
            }
            i = i + 1
        }
        keys.append("\(i).0")
        return keys
    }
    
    static func getFeetHeight() -> [HeightDataTypeModel] {
        var heights = [HeightDataTypeModel]()
        var i = startFeet
        while i < endFeet {
            var height = HeightDataTypeModel()
            for j in 0..<12 {
                height = HeightDataTypeModel()
                height.id = "\(i).\(j)"
                height.value = "\(i)'\(j)''"
                heights.append(height)
            }
            i = i + 1
        }
        var height = HeightDataTypeModel()
        height.id = "\(i).0"
        height.value = "\(i)'0"
        heights.append(height)
        return heights
    }
    
    static func convertFeetIntoCm(feet:Float) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedHeight = formatter.string(from: (feet * 30.48) as NSNumber)!
        return formattedHeight
    }
    
    static func convertCmIntoFeet(cm:Float)-> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        let formattedHeight = formatter.string(from: (cm / 30.48) as NSNumber)!
        return formattedHeight
    }
}
