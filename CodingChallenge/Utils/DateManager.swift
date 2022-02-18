//
//  DateManager.swift
//  CodingChallenge
//
//  Created by Hesham Donia on 18/02/2022.
//

import Foundation

class DateManager {
    
    static func convertStringToDate(dateString :String, format: String? = nil, timeZoneId: String? = nil) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = format == nil ? "yyyy-MM-ddTHH:mm:ss" : format //Your date format
        dateFormatter.timeZone = timeZoneId == nil ? TimeZone.current : TimeZone(abbreviation: timeZoneId ?? "")
        if let date = dateFormatter.date(from: dateString) {
            return date
        }
        return Date()
    }
    
    static func convertDateToString(date :Date, format :String? = nil) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat = format == nil ? "yyyy-MM-ddTHH:mm:ss" : format
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    static func utcToLocal(dateStr: String, format: String? = nil) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format == nil ? "yyyy-MM-ddTHH:mm:ss" : format
        dateFormatter.calendar = Calendar.current
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: dateStr) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = format == nil ? "yyyy-MM-ddTHH:mm:ss" : format
        
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
