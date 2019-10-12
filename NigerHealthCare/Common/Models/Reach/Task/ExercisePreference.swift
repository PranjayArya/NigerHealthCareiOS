//
//  ExercisePreference.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation


struct ExercisePreferenceModel {
    var id = ""
    var value = ""
}

enum ExercisePreference{
    
    static let DATA_TYPE = "ExercisePreferences:1"
    static let DEFAULT = ["yoga"]
    static let RES_DATA_TYPE = "ExercisePreferences"
    
    static let rowIds = ["crdo","str","yoga"]
    static let rowValues = ["Cardio","Strength","Yoga"]
    
    static func getExercisePreferenceIds() -> [String] {
        return rowIds
    }
    
    static func getExercisePreferences() -> [ExercisePreferenceModel] {
        var genders = [ExercisePreferenceModel]()
        for i in 0..<rowIds.count {
            var gender = ExercisePreferenceModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
