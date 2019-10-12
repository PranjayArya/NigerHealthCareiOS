//
//  HipDataType.swift
//  Reach
//
//  Created by DelTen Obino on 21/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct HipDataTypeModel {
    var id = ""
    var value = ""
}
enum HipDataType {
    
    static let DATA_TYPE = " Hip:1"
    static let DEFAULT = "70"
    static let RES_DATA_TYPE = " Hip"
    
    static let start:Float = 63.5
    static let end:Float = 381.0
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
    
    static func getData() -> [ HipDataTypeModel] {
        var hips = [HipDataTypeModel]()
        var i = start
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        while i < end {
            var hip =  HipDataTypeModel()
            let formattedWeight = formatter.string(from: i as NSNumber)!
            hip.id = "\(formattedWeight)"
            hip.value = "\(formattedWeight) Inch"
            hips.append(hip)
            i = i + interval
        }
        var hip =  HipDataTypeModel()
        let formattedWeight = formatter.string(from: i as NSNumber)!
        hip.id = "\(formattedWeight)"
        hip.value = "\(formattedWeight) Inch"
        hips.append(hip)
        return hips
    }
}
