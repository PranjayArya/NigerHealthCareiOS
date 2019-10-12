//
//  CalfDataType.swift
//  Reach
//
//  Created by DelTen Obino on 21/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation


struct CalfDataTypeModel {
    var id = ""
    var value = ""
}
enum CalfDataType {
    
    static let DATA_TYPE = " Calf:1"
    static let DEFAULT = "12.5"
    static let RES_DATA_TYPE = " Calf"
    
    static let start:Float = 12.5
    static let end:Float = 63.5
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
    
    static func getData() -> [CalfDataTypeModel] {
        var calfs = [CalfDataTypeModel]()
        var i = start
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        while i < end {
            var calf = CalfDataTypeModel()
            let formattedWeight = formatter.string(from: i as NSNumber)!
            calf.id = "\(formattedWeight)"
            calf.value = "\(formattedWeight) Inch"
            calfs.append(calf)
            i = i + interval
        }
        var calf = CalfDataTypeModel()
        let formattedWeight = formatter.string(from: i as NSNumber)!
        calf.id = "\(formattedWeight)"
        calf.value = "\(formattedWeight) Inch"
        calfs.append(calf)
        return calfs
    }
}
