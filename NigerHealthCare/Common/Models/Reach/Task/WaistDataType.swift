//
//  WaistDataType.swift
//  Reach
//
//  Created by DelTen Obino on 21/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct WaistDataTypeModel {
    var id = ""
    var value = ""
}
enum WaistDataType {
    
    static let DATA_TYPE = "Waist:1"
    static let DEFAULT = "60"
    static let RES_DATA_TYPE = "Waist"
    
    static let start:Float = 50.5
    static let end:Float = 254.5
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
    
    static func getData() -> [WaistDataTypeModel] {
        var waists = [WaistDataTypeModel]()
        var i = start
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        while i < end {
            var waist = WaistDataTypeModel()
            let formattedWeight = formatter.string(from: i as NSNumber)!
            waist.id = "\(formattedWeight)"
            waist.value = "\(formattedWeight) Inch"
            waists.append(waist)
            i = i + interval
        }
        var waist = WaistDataTypeModel()
        let formattedWeight = formatter.string(from: i as NSNumber)!
        waist.id = "\(formattedWeight)"
        waist.value = "\(formattedWeight) Inch"
        waists.append(waist)
        return waists
    }
}
