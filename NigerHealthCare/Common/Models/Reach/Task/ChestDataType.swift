//
//  ChestDataType.swift
//  Reach
//
//  Created by DelTen Obino on 21/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import UIKit

struct ChestDataTypeModel {
    var id = ""
    var value = ""
}
enum ChestDataType {
 
    static let DATA_TYPE = "Chest:1"
    static let DEFAULT = "30"
    static let RES_DATA_TYPE = "Chest"
    
    static let start:Float = 25
    static let end:Float = 150.0
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
    
    static func getData() -> [ChestDataTypeModel] {
        var chests = [ChestDataTypeModel]()
        var i = start
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        while i < end {
            var chest = ChestDataTypeModel()
            let formattedWeight = formatter.string(from: i as NSNumber)!
            chest.id = "\(formattedWeight)"
            chest.value = "\(formattedWeight) Inch"
            chests.append(chest)
            i = i + interval
        }
        var chest = ChestDataTypeModel()
        let formattedWeight = formatter.string(from: i as NSNumber)!
        chest.id = "\(formattedWeight)"
        chest.value = "\(formattedWeight) Inch"
        chests.append(chest)
        return chests
    }
    
}
