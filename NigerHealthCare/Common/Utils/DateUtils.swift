//
//  DateUtils.swift
//  Reach
//
//  Created by Abhayam Rastogi on 05/07/18.
//  Copyright © 2018 RoundGlass. All rights reserved.
//

import Foundation

class DateUtils {
    
    public enum DurationType: String {
        case year, month, week, day
    }
    
    public class func getDisplayDuration(fromDuration duration: Int,
                                         ofType type: DurationType) -> String {
        if duration == 1 {
            return "1 \(type.rawValue)".localizedCapitalized
        }
        
        return "\(duration) \(type.rawValue)s".localizedCapitalized
    }
    
    // MARK: Conversions to Date
    
    public class func toDate(fromDateString dateString: String) -> Date? {
        return toDate(fromDateString: dateString, format: "yyyy-MM-dd")
    }
    
    public class func toDate(fromDateNameString dateString: String) -> Date? {
        return toDate(fromDateString: dateString, format: "MMM d, yyyy")
    }
    
    public class func toDate(fromDateTimeString dateString: String) -> Date? {
        return toDate(fromDateString: dateString, format: "yyyy-MM-dd HH:mm:ss")
    }
    
    public class func toDate(fromDateTimeDayString dateString: String) -> Date? {
        return toDate(fromDateString: dateString, format: "E MMM d HH:mm:ss Z yyyy")
    }
    
    public class func toDate(fromTimeString timeString: String) -> Date? {
        return toDate(fromDateString: timeString, format: "HH:mm")
    }
    
    public class func toDate(fromTimeStringWithSeconds timeString: String) -> Date? {
        return toDate(fromDateString: timeString, format: "HH:mm:ss")
    }
    
    class func toDateFormat1(fromDateString dateString:String) -> Date? {
        return toDate(fromDateString: dateString, format: "d MMM, yyyy")
    }
    
    class func toDateFormat2(fromDateString dateString:String) -> Date? {
        return toDate(fromDateString: dateString, format: "dd-MMM-yyyy")
    }
    
    class func toDate(fromZoneDateString dateString:String) -> Date? {
        return toDate(fromDateString: dateString, format: "yyyy-MM-dd'T'HH:mm:ss'Z'ZZZZ")
    }
    
    public class func toDate(fromDateString dateString: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)
    }
    
    // MARK: Conversion to date strings
    
    public class func toDateString(fromDate date: Date) -> String? {
        return toDateTimeString(fromDate: date, format: "yyyy-MM-dd")
    }
    
    public class func toDateStringMonth(fromDate date: Date) -> String?{
        return toDateTimeString(fromDate: date, format: "MMM-dd-yy")
    }
    
    public class func toDateTimeString(fromDate date: Date) -> String? {
        return toDateTimeString(fromDate: date, format: "yyyy-MM-dd HH:mm")
    }
    
    public class func toDateTimeStringWithSeconds(fromDate date: Date) -> String? {
        return toDateTimeString(fromDate: date, format: "yyyy-MM-dd HH:mm:ss")
    }
    
    public class func toDateTimeString(fromDate date: Date, format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
    
    // MARK: Conversions to displayable formats
    
    public class func toDateDisplayFormat1(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toDateDisplayFormat2(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE dd"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toDateDisplayFormat3(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toDateDisplayFormat4(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toMonthDisplayFormat1(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toTimeString(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toTimeStringWithSeconds(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toTimeFormat(fromString dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.date(from:dateString)
    }
    
    class func toTimeFormatdMMM(fromDateString date:Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter.string(from: date)
    }
    
    class func toTimeFormatMMMdd(fromDateString date:Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: date)
    }
    
    class func toDateFormatHHMMAMPM(fromDateString date:Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        return dateFormatter.string(from: date)
    }
    
    /// Pukes put a display string for time in 12 hr format.
    ///
    /// - Parameter date: Date that needs to be converted.
    /// - Returns: Display string.
    public class func toTimeDisplayFormat1(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        
        return dateFormatter.string(from: date)
    }
    
    /// Pukes put a display string for time in 12 hr format with the date.
    ///
    /// - Parameter date: Date that needs to be converted.
    /// - Returns: Display string.
    public class func toTimeDisplayFormat2(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, yy hh:mm a"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toTimeDisplayFormat3(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a, d MMM, yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toTimeDisplayFormat4(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, h:mm a"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toTimeDisplayFormat5(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy, h:mm a"
        
        return dateFormatter.string(from: date)
    }
    
    public class func toTimeDisplayFormat6(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, h:mm a"
        
        return dateFormatter.string(from: date)
    }
    
    // MARK: Utilities & Date manipulations
    
    public class func toDateDisplayFormatTh(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, YYYY"
        
        let calendar = Calendar.current
        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
        
        var day  = "\(anchorComponents.day!)"
        switch (day) {
        case "1" , "21" , "31":
            day.append("st")
        case "2" , "22":
            day.append("nd")
        case "3" ,"23":
            day.append("rd")
        default:
            day.append("th")
        }
        
        
        return day + " " + dateFormatter.string(from: date)
    }
    
    public class func toDateDisplayMonthFormatTh(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, YYYY"
        
        let calendar = Calendar.current
        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
        
        var day  = "\(anchorComponents.day!)"
        switch (day) {
        case "1" , "21" , "31":
            day.append("st")
        case "2" , "22":
            day.append("nd")
        case "3" ,"23":
            day.append("rd")
        default:
            day.append("th")
        }
        
        
        return day + " " + dateFormatter.string(from: date)
    }
    
    
    public class func dateByAdding(days: Int, hour: Int, min: Int, toDate date: Date) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.day = days
        dateComponents.hour = hour
        dateComponents.minute = min
        
        return Calendar.current.date(byAdding: dateComponents, to: date)
    }
    
    public class func yearsPassed(since date: Date) -> Int {
        let now = Date()
        let seconds: Int = Int(now.timeIntervalSince(date))
        let secondsInYear = 31536000
        
        return seconds / secondsInYear
    }
    
    public class func daysPassed(since date: Date) -> Int {
        let now = Date()
        let seconds: Int = Int(now.timeIntervalSince(date))
        let secondsInDay = 86400
        
        return seconds / secondsInDay
    }
    
    public class func startOfWeek(with date: Date) -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .yearForWeekOfYear, .weekOfYear], from: date)
        components.weekday = Calendar.current.firstWeekday + 1
        components.hour = 0
        components.minute = 0
        components.second = 0
        return Calendar.current.date(from: components)!
    }
    
    public class func endOfWeek(with date: Date) -> Date {
        return Calendar.current.date(byAdding: .second, value: 604799, to: startOfWeek(with: date))!
    }
    
    public class func getDayOfWeek(fromDate date: Date) -> String {
        let cal = Calendar(identifier: .gregorian)
        let dayOfWeek = cal.component(.weekday, from: date)
        switch dayOfWeek {
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        case 7:
            return "Saturday"
        default:
            return ""
        }
    }
    
    public class func timestampAsNumber() -> Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    
    public class func convertOneFormatToAnother(dateString:String,inputFormat:String,outputFormat:String) -> String?{
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat
        
        if let date = inputFormatter.date(from: dateString) {
            
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = outputFormat
            
            return outputFormatter.string(from: date)
        }
        
        return nil

    }
}
