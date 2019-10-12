//
//  ThighDataType.swift
//  Reach
//
//  Created by DelTen Obino on 21/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation


struct ThighDataTypeModel {
    var id = ""
    var value = ""
}
enum ThighDataType {
    
    static let DATA_TYPE = " Thigh:1"
    static let DEFAULT = "20"
    static let RES_DATA_TYPE = " Thigh"
    
    static let start:Float = 20.0
    static let end:Float = 101.5
    static let interval:Float = 0.5
    
    static func getIds() -> [String] {
        var keys = [String]()
        var i = start
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        while i < end {
            let formattedWeight = formatter.string(from: i as NSNumber)!
            keys.append(formattedWeight)
            i = i + interval
        }
        return keys
    }
    
    static func getData() -> [ThighDataTypeModel] {
        var thighs = [ThighDataTypeModel]()
        var i = start
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        while i < end {
            var thigh = ThighDataTypeModel()
            let formattedWeight = formatter.string(from: i as NSNumber)!
            thigh.id = "\(formattedWeight)"
            thigh.value = "\(formattedWeight) Inch"
            thighs.append(thigh)
            i = i + interval
        }
        var thigh = ThighDataTypeModel()
        let formattedWeight = formatter.string(from: i as NSNumber)!
        thigh.id = "\(formattedWeight)"
        thigh.value = "\(formattedWeight) Inch"
        thighs.append(thigh)
        return thighs
    }
}
