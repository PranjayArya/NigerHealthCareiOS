//
//  FoodPreference.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct FoodPreferenceModel {
    var id = ""
    var value = ""
}

enum FoodPreference{
    
    static let DATA_TYPE = "FoodPreferences:1"
    static let DEFAULT = ["egg"]
    static let RES_DATA_TYPE = "FoodPreferences"
    
    static let rowIds = ["veg","egg","ckn","fis","cfd","prk","bef","mtn"]
    static let rowValues = ["Veg","Egg","Chicken","Fish","Seafood","Pork","Beef","Mutton"]
    
    static func getFoodPreferenceIds() -> [String] {
        return rowIds
    }
    
    static func getFoodPreferences() -> [FoodPreferenceModel] {
        var genders = [FoodPreferenceModel]()
        for i in 0..<rowIds.count {
            var gender = FoodPreferenceModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
