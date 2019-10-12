//
//  WeightDataType.swift
//  Reach
//
//  Created by DelTen Obino on 21/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

import UIKit

struct WeightDataTypeModel {
    var id = ""
    var value = ""
}

enum WeightDataType{
    
    static let DATA_TYPE = "TWeight:1"
    static let DEFAULT = "55"
    static let RES_DATA_TYPE = "Weight"
    
    static let start:Float = 3.0
    static let end:Float = 170.0
    static let interval:Float = 0.1
    
    static func getWeightIds() -> [String] {
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
    
    static func getWeight() -> [WeightDataTypeModel] {
        var weights = [WeightDataTypeModel]()
        var i = start
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        while i < end {
            var weight: WeightDataTypeModel?
            weight = WeightDataTypeModel()
            let formattedWeight = formatter.string(from: i as NSNumber)!
            weight?.id = "\(formattedWeight)"
            weight?.value = "\(formattedWeight) KG"
            weights.append(weight!)
            i = i + interval
        }
        var weight = WeightDataTypeModel()
        let formattedWeight = formatter.string(from: i as NSNumber)!
        weight.id = "\(formattedWeight)"
        weight.value = "\(formattedWeight) KG"
        weights.append(weight)
        return weights
    }
    
}
