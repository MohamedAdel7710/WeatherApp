//
//  DateFormatter.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 03/08/2024.
//

import Foundation


struct TimeDateFormatter {
    
    static func getTime(from timeStamp: Int) -> String {
        let timeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        return date.formatted(date: .omitted, time: .shortened)
    }
}
