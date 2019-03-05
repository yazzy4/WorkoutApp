//
//  String+Extensions.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/4/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation
struct WeatherDateHelper {
    static func formatISOToDate(dateString: String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = dateString
        if let date = isoDateFormatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
        
    }
    static func formatISOToTime(dateString: String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = dateString
        if let date = isoDateFormatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
}
