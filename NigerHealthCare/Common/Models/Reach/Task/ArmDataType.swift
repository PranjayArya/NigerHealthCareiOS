//
//  ArmDataType.swift
//  Reach
//
//  Created by DelTen Obino on 21/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct ArmDataTypeModel {
    var id = ""
    var value = ""
}
enum ArmDataType {
    
    static let DATA_TYPE = "  Arm:1"
    static let DEFAULT = "14"
    static let RES_DATA_TYPE = "  Arm"
    
    static let start:Float = 12.5
    static let end:Float = 50.5
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
    
    static func getData() -> [  ArmDataTypeModel] {
        var arms = [  ArmDataTypeModel]()
        var i = start
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        while i < end {
            var arm =   ArmDataTypeModel()
            let formattedWeight = formatter.string(from: i as NSNumber)!
            arm.id = "\(formattedWeight)"
            arm.value = "\(formattedWeight) Inch"
            arms.append(arm)
            i = i + interval
        }
        var arm =   ArmDataTypeModel()
        let formattedWeight = formatter.string(from: i as NSNumber)!
        arm.id = "\(formattedWeight)"
        arm.value = "\(formattedWeight) Inch"
        arms.append(arm)
        return arms
    }
}
