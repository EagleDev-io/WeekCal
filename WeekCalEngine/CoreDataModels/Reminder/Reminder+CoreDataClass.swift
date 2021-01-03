//
//  ReminderMO+CoreDataClass.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 3/01/21.
//
//

import Foundation
import CoreData

@objc(Reminder)
public class Reminder: NSManagedObject {
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
        self.dayOfWeek = DayOfWeek(fromDate: Date())
        self.id = UUID()
    }
}
