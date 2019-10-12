//
//  FoodAllergyOrIntolerance.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation


struct FoodAllergyModel {
    var id = ""
    var value = ""
}

enum FoodAllergyOrIntolerance{
    
    static let DATA_TYPE = "FoodAllergyOrIntolerance:1"
    static let DEFAULT = "shellfish"
    static let RES_DATA_TYPE = "FoodAllergyOrIntolerance"
    
    static let rowIds = ["none","cowmlk","egg","pnuts","treenuts","soy","fishes","shellfish","wheat","barley","rye","lactose"]
    static let rowValues = ["None","Cow Milk","Eggs","Peanuts","Tree Nuts","Soy","Fishes","Shellfish","Wheat","Barley","Rye","Lactose"]
    
    static func getFoodAllergyIds() -> [String] {
        return rowIds
    }
    
    static func getFoodAllergies() -> [FoodAllergyModel] {
        var genders = [FoodAllergyModel]()
        for i in 0..<rowIds.count {
            var gender = FoodAllergyModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
