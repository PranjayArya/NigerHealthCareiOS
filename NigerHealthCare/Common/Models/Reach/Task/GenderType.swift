//
//  Gender.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct GenderModel {
    var id = ""
    var value = ""
}

enum GenderType {
    
    static let DATA_TYPE = "Gender:1"
    static let DEFAULT = "m"
    static let RES_DATA_TYPE = "Gender"
    
    static let rowIds = ["m","f"]
    static let rowValues = ["Male","Female"]
    
    static func getGenderIds() -> [String] {
        return rowIds
    }
    
    static func getGenders() -> [GenderModel] {
        var genders = [GenderModel]()
        for i in 0..<rowIds.count {
            var gender = GenderModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
