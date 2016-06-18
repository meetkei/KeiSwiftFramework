//
//  KInterval.swift
//
//  Copyright (c) 2016 Keun young Kim <app@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

infix operator ~ { associativity left precedence 150 }
public func ~(lhs: NSDate, rhs: NSDate) -> NSTimeInterval {
    return lhs.timeIntervalSince1970 - rhs.timeIntervalSince1970
}

public class KInterval: NSObject {
    public class func exceeded(interval: NSTimeInterval, minDate: NSDate, maxDate: NSDate = Today.now) -> Bool {
        return maxDate - minDate > interval
    }
    
    
    
    public class func years(minDate minDate: NSDate, maxDate: NSDate) -> Int {
        assert(minDate <= maxDate, "minDate > maxDate")
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Year], fromDate: minDate, toDate: maxDate, options:[])
        return components.year
    }
    
    
    
    public class func months(minDate minDate: NSDate, maxDate: NSDate) -> Int {
        assert(minDate <= maxDate, "minDate > maxDate")
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Month], fromDate: minDate, toDate: maxDate, options:[])
        return components.month
    }
    
    
    
    public class func days(minDate minDate: NSDate, maxDate: NSDate) -> Int {
        assert(minDate <= maxDate, "minDate > maxDate")
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day], fromDate: minDate, toDate: maxDate, options:[])
        return components.day
    }
    
    
    
    public class func days(range range: KDateRange) -> Int {
        return days(minDate: range.beginDate, maxDate: range.endDate)
    }
    
    
    
    public class func dateByAddingDays(day: Int, toDate: NSDate) -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        
        let comps = NSDateComponents()
        comps.day = day
        
        return calendar.dateByAddingComponents(comps, toDate: toDate, options: [])!
    }
    
    
    
    public class func hours(minDate minDate: NSDate, maxDate: NSDate) -> Int {
        assert(minDate <= maxDate, "minDate > maxDate")
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour], fromDate: minDate, toDate: maxDate, options:[])
        return components.hour
    }
    
    
    
    public class func minutes(minDate minDate: NSDate, maxDate: NSDate, minValue: Int = 0) -> Int {
        assert(minDate <= maxDate, "minDate > maxDate")
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Minute], fromDate: minDate, toDate: maxDate, options:[])
        
        return max(components.minute, minValue)
    }
    
    
    
    public class func minutesBeforeNow(date: NSDate, minValue: Int = 0) -> Int {
        return minutes(minDate: date, maxDate: NSDate(), minValue: minValue)
    }
    
    
    
    public class func minutesAfterNow(date: NSDate, minValue: Int = 0) -> Int {
        return minutes(minDate: NSDate(), maxDate: date, minValue: minValue)
    }
    
    
    
    public class func dateByAddingSeconds(second: Int, toDate: NSDate) -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        
        let comps = NSDateComponents()
        comps.second = second
        
        return calendar.dateByAddingComponents(comps, toDate: toDate, options: [])!
    }
}