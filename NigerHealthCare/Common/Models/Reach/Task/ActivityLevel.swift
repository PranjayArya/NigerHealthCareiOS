//
//  ActivityLevel.swift
//  Reach
//
//  Created by DelTen Obino on 14/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation
import UIKit

struct ActivityLevelModel {
    var id = ""
    var value = ""
}

enum ActivityLevel {
    
    static let DATA_TYPE = "ActivityLevel:1"
    static let DEFAULT = "med"
    static let RES_DATA_TYPE = "ActivityLevel"
    
    static let rowIds = ["sed","lgt","med","hvy"]
    static let rowValues = ["Sedentary","Light","Medium","Heavy"]
    
    static func getActivityLevelIds() -> [String] {
        return rowIds
    }
    
    static func getActivityLevels() -> [ActivityLevelModel] {
        var genders = [ActivityLevelModel]()
        for i in 0..<rowIds.count {
            var gender = ActivityLevelModel()
            gender.id = rowIds[i]
            gender.value = rowValues[i]
            genders.append(gender)
        }
        return genders
    }
}
