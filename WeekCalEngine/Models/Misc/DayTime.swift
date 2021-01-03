//
//  DayTime.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 2/01/21.
//

import Foundation

public struct DayTime: Equatable, CustomStringConvertible {
    var hour: Int
    var minute: Int

    init(hour: Int, minutes: Int = 0) {
        self.hour = hour % 24
        self.minute = minutes % 60
    }
    
    public init(timeInterval: TimeInterval) {
        minute = timeInterval.minutes
        hour = timeInterval.hours
    }
    
    public static func now() -> DayTime {
        let date = Date()
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: date)
        let hour = calendar.component(.hour, from: date)
        return DayTime(hour: hour, minutes: minute)
    }
    
    public var timeInterval: TimeInterval {
        Double(minute * 60 + hour * 3600)
    }
    
    public var description: String {
        let hourString = "\(hour)".paddingLeft(toLength: 2, withPad: "0")
        let minutesString = "\(minute)".paddingLeft(toLength: 2, withPad: "0")
        return "\(hourString):\(minutesString)"
    }
    
    public mutating func add(timeInterval: TimeInterval) {
        hour = (hour + timeInterval.hours) % 24
        minute = (minute + timeInterval.minutes) % 60
    }
    
    public func adding(timeInterval: TimeInterval) -> DayTime {
        let newHour = (hour + timeInterval.hours) % 24
        let newMinute = (minute + timeInterval.minutes) % 60
        return DayTime(hour: newHour, minutes: newMinute)
    }
}


extension String {
    func paddingLeft(toLength: Int, withPad pad: String) -> String {
        let chars = self.padding(toLength: toLength, withPad: pad, startingAt: 0).reversed()
        return String(chars)
    }
}
