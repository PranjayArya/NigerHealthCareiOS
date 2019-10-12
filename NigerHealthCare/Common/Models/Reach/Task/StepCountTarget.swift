//
//  StepCountTarget.swift
//  Reach
//
//  Created by DelTen Obino on 15/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

struct StepCountTargetModel {
    var step = ""
    var stepValue = ""
}
enum StepCountTarget{
    
    static let DATA_TYPE = "StepCountTarget:1"
    static let DEFAULT = "5000"
    static let RES_DATA_TYPE = "StepCountTarget"
    
    static let startStep = 1000
    static let endStep = 100001
    static let interval = 50
  
    
    static func getStepsIds() -> [String] {
        var keys = [String]()
        var i = startStep
        while i < endStep {
            keys.append("\(i)")
            i = i + interval
        }
        return keys
    }
    
    static func getSteps() -> [StepCountTargetModel] {
        var steps = [StepCountTargetModel]()
        var i = startStep
         while i < endStep {
            var step = StepCountTargetModel()
            step.step = "\(i)"
            step.stepValue = "\(i)"
            steps.append(step)
            i += interval
        }
        return steps
    }
}
