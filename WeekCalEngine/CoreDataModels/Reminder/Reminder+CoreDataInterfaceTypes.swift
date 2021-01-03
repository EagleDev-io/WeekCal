//
//  Reminder+CoreDataInterfaceTypes.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 2/01/21.
//

import CoreData

extension Reminder {
    public var periodicity: Periodicity {
        get {
            return Periodicity(rawValue: self.periodicityValue)!
        }
        
        set {
            self.periodicityValue = newValue.rawValue
        }
    }
    
    
    public var dayOfWeek: DayOfWeek {
        get {
            return DayOfWeek(rawValue: self.dayOfWeekValue)!
        }
        
        set {
            self.dayOfWeekValue = newValue.rawValue
        }
    }
    
    public var dayTime: DayTime {
        get {
            return DayTime(timeInterval: self.remindAt)
        }
        
        set {
            self.remindAt = newValue.timeInterval
        }
    }
    

}
