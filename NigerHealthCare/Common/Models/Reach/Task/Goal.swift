//
//  Goal.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct GoalModel {
    var id = ""
    var value = ""
}

enum Goal{
    
    static let DATA_TYPE = "Goal:1"
    static let DEFAULT = "wtl"
    static let RES_DATA_TYPE = "Goal"
    
    static let rowIds = ["wtl","wtg","wtm"]
    static let rowValues = ["Weight Loss","Weight Gain","Weight Maintenance"]
    
    static func getGoalIds() -> [String] {
        return rowIds
    }
    
    static func getGoals() -> [GoalModel] {
        var genders = [GoalModel]()
        for i in 0..<rowIds.count {
            var gender = GoalModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
