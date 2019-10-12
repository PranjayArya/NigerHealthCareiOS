//
//  UserInfoUtils.swift
//  CrossPatient
//
//  Created by Rahul Nagpal on 29/12/16.
//  Copyright © 2016 RoundGlass Partners. All rights reserved.
//

import Foundation

public struct UserInfoUtils {
    
    public static func checkPatientId() -> String {
        if let patientId = AuthUtils.getUserId() {
            return patientId
        }
        else {
            return ""
        }
    }
}
