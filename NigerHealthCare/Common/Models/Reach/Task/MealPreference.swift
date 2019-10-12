//
//  MealPreference.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct MealPreferenceModel {
    var id = ""
    var value = ""
}

enum MealPreference{
    
    static let DATA_TYPE = "MealPreferences:1"
    static let DEFAULT = "bf"
    static let RES_DATA_TYPE = "MealPreferences"
    
    static let rowIds = ["em","bf","snk","lnh","tea","dnr","pdn"]
    static let rowValues = ["Early Morning","Breakfast","Snack","Lunch","Tea","Dinner","Post Dinner"]
    
    static func getMealPreferenceIds() -> [String] {
        return rowIds
    }
    
    static func getMealPreferences() -> [MealPreferenceModel] {
        var genders = [MealPreferenceModel]()
        for i in 0..<rowIds.count {
            var gender = MealPreferenceModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
