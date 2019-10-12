//
//  CalendarExtension.swift
//  CrossPatient
//
//  Created by Abhayam Rastogi on 08/01/17.
//  Copyright © 2017 RoundGlass Partners. All rights reserved.
//

import UIKit

extension Calendar{
 
    static var gregorianCalendar: Calendar {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
       // gregorian.timeZone = TimeZone(abbreviation: "UTC")!
        return gregorian
    }  
}
