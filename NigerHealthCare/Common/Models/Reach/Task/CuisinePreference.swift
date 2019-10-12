//
//  CuisinePreference.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation


struct CuisinePreferenceModel {
    var id = ""
    var value = ""
}

enum CuisinePreference{
    
    static let DATA_TYPE = "CuisinePreferences:1"
    static let DEFAULT = ["southindian"]
    static let RES_DATA_TYPE = "CuisinePreferences"
    
    static let rowIds = ["all","indian","northindian","southindian"]
    static let rowValues = ["All","indian", "North indian", "South indian"]
    
    static func getCuisinePreferenceIds() -> [String] {
        return rowIds
    }
    
    static func getCuisinePreferences() -> [CuisinePreferenceModel] {
        var genders = [CuisinePreferenceModel]()
        for i in 0..<rowIds.count {
            var gender = CuisinePreferenceModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
