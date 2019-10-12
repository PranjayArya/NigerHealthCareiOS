//
//  RateOfChange.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct RateOfChangeModel {
    var id = ""
    var value = ""
}

enum RateOfChange{
    
    static let DATA_TYPE = "RateOfChange:1"
    static let DEFAULT = "0.45"
    static let RES_DATA_TYPE = "RateOfChange"
    
    static let rowIds = ["0.45","0.9"]
    static let rowValues = ["0.45","0.9"]
    
    static func getRateOfChangeIds() -> [String] {
        return rowIds
    }
    
    static func getRateOfChanges() -> [RateOfChangeModel] {
        var genders = [RateOfChangeModel]()
        for i in 0..<rowIds.count {
            var gender = RateOfChangeModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
