//
//  DayOfWeek.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 2/01/21.
//

import Foundation


public enum DayOfWeek: Int64, CaseIterable, CustomStringConvertible, Equatable {
    public var description: String {
        switch self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Satuday"
        case .sunday:
            return "Sunday"
        }
    }
    
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    public init(fromDate date: Date) {
        let calendar = Calendar.current
        let component = calendar.component(.weekday, from: date)
        self.init(rawValue: Int64(component))!
    }
    
    public static func today() -> DayOfWeek {
        DayOfWeek(fromDate: Date())
    }
}


