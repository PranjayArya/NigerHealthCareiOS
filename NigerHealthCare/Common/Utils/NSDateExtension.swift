//
//  NSDateExtension.swift
//  Cross_Base_Framework
//
//  Created by Anurag Agnihotri on 22/08/16.
//  Copyright © 2016 RoundGlass Partners. All rights reserved.
//

import Foundation

extension Date {
    var dayAfter:Date {
        let oneDay:Double = 60 * 60 * 24
        return self.addingTimeInterval(oneDay)
    }
    var dayBefore:Date {
        let oneDay:Double = 60 * 60 * 24
        return self.addingTimeInterval(-(Double(oneDay)))
    }
    

  /// Returns the amount of years from another date
  func years(from date: Date) -> Int {
    return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
  }
 
  /// Returns the amount of days from another date
  func days(from date: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
  }
  /// Returns the amount of hours from another date
  func hours(from date: Date) -> Int {
    return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
  }
  /// Returns the amount of minutes from another date
  func minutes(from date: Date) -> Int {
    return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
  }
  /// Returns the amount of seconds from another date
  func seconds(from date: Date) -> Int {
    return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
  }
  /// Returns the a custom time interval description from another date
  func offset(from date: Date) -> String {
    if years(from: date)   > 0 { return "\(years(from: date))y"   }
    if months(from: date)  > 0 { return "\(months(from: date))M"  }
    if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
    if days(from: date)    > 0 { return "\(days(from: date))d"    }
    if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
    if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
    if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
    return ""
  }

  
    func dayName() -> String? {
        
        let weekDay = Calendar.current.dateComponents([.weekday], from: self).weekday
        let weekArray = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
        return weekArray[weekDay!-1]
    }
}

extension Calendar {
  /**
   Returns a tuple containing the start and end dates for the week that the
   specified date falls in.
   */
  func weekDatesForDate(_ date: Date) -> (start: Date, end: Date) {
    var interval: TimeInterval = 0
    var start: Date = Date()
    _ = dateInterval(of: .weekOfYear, start: &start, interval: &interval, for: date)
    let end = start.addingTimeInterval(interval)
    
    return (start as Date, end as Date)
  }
}

