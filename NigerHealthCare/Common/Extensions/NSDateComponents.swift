/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

extension DateComponents {
  static var firstDateOfCurrentWeek: DateComponents {
    var beginningOfWeek: NSDate?
    
    let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    gregorian?.timeZone = TimeZone(abbreviation: "UTC")!
    gregorian!.range(of: .weekOfYear, start: &beginningOfWeek, interval: nil, for: Date())
    let dateComponents = gregorian?.components([.era, .year, .month, .day, .hour, .minute, .second],
                                               from: beginningOfWeek! as Date)
    //let dateComponents = gregorian?.components([.era, .year, .month, .day],
    //                                           from: beginningOfWeek! as Date)

    return dateComponents!
  }
    
    static var getPreviousSevenDays: DateComponents {
        var comps = DateComponents.init()
        comps.day   = -7;

        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        gregorian?.timeZone = TimeZone(abbreviation: "UTC")!
        let newDate = gregorian?.date(byAdding: comps, to: Date())
        let components = gregorian?.components([.era, .year, .month, .day, .hour, .minute, .second],
                                                 from: newDate!)
        return components!
    }
    
    static func getPreviousSevenDaysFromDate(date:Date)->(dateComponents:DateComponents?,date:Date?) {
        var comps = DateComponents()
        comps.day   = -7;
        let calendar = Calendar.current
        let newDate = calendar.date(byAdding: comps, to: date)
        let components = calendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second],
                                               from: newDate!)
        return (components,newDate)
    }

    static var weeksCount:Int?{
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let range = gregorian?.range(of: .weekOfMonth, in: .month, for: Date())
        return range?.length
    }

    
    static var getPreviousYear: DateComponents {
        var comps = DateComponents.init()
        comps.year   = -1;
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        gregorian?.timeZone = TimeZone(abbreviation: "UTC")!
        let newDate = gregorian?.date(byAdding: comps, to: Date())
        let components = gregorian?.components([.era, .year, .month, .day, .hour, .minute, .second],
                                               from: newDate!)
        return components!
    }
    
    static var getPreviousMonth: DateComponents {
        var comps = DateComponents.init()
        comps.month   = -1;
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        gregorian?.timeZone = TimeZone(abbreviation: "UTC")!
        let newDate = gregorian?.date(byAdding: comps, to: Date())
        let components = gregorian?.components([.era, .year, .month, .day, .hour, .minute, .second],
                                               from: newDate!)
        return components!
    }
    
    static func gregorianDateComponentsFromDate(date:Date)-> DateComponents {
        let gregorian = Calendar.gregorianCalendar
//        let dateComponents = gregorian.dateComponents([.era, .year, .month, .day, .hour, .minute, .second],
//                                                   from: date)
        let dateComponents = gregorian.dateComponents([.era, .year, .month, .day, .hour, .minute, .second],
                                                   from: date)

        return dateComponents
    }
    
    static func dateComponentsFromDate(date:Date, forCalendar:Calendar)-> DateComponents {
        //        let dateComponents = gregorian.dateComponents([.era, .year, .month, .day, .hour, .minute, .second],
        //                                                   from: date)
        let dateComponents = forCalendar.dateComponents([.era, .year, .month, .day, .hour, .minute, .second],
                                                      from: date)
        
        return dateComponents
    }
    
   var date: Date {
    let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    gregorian?.locale = Locale.current
    let date = gregorian?.date(from: self)
    return date!
  }
  

    static func maxMinEighteenYearDateBasedOnToday()->MAX_MIN_DATE{
        let gregorian = Calendar.gregorianCalendar
        let currentDate = Date()
        var components = DateComponents()
        
        components.year = -18
        let maxDate = gregorian.date(byAdding: components, to: currentDate)
        
        components.year = -150
        let minDate = gregorian.date(byAdding: components, to: currentDate)

        return (minDate!,maxDate!)
    }
}
