//
//  RemindersService.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 2/01/21.
//

import Foundation
import CoreData

public class RemindersService {
    let coreDataStack: CoreDataStack
    
    private lazy var context = self.coreDataStack.mainContext
    
    public init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    public func create(_ reminder: String, dayOfWeek: DayOfWeek? = nil) -> Reminder {
        let newReminder = Reminder(context: context)
        newReminder.content = reminder
        newReminder.dayOfWeek = dayOfWeek ?? DayOfWeek.today()
        return newReminder
    }
    
    public func save() {
        coreDataStack.saveContext()
    }
    
    public func addReminder(_ reminderText: String, dayOfWeek: DayOfWeek? = nil, tags: [String] = []) {
        let reminder = Reminder(context: context)
        reminder.dayOfWeek = dayOfWeek ?? DayOfWeek.today()
        reminder.content = reminderText

        tags.forEach { tagString in
            let tag = Tag(context: context)
            tag.name = tagString
            reminder.addToTags(tag)
        }

        coreDataStack.saveContext()
    }
    
    public static func defaultFetchRequest(_ dayOfWeek: DayOfWeek? = nil) -> NSFetchRequest<Reminder> {
        let day = dayOfWeek ?? DayOfWeek.today()
        let fetchRequest: NSFetchRequest<Reminder> = Reminder.fetchRequest()
        let predicate = NSPredicate(format: "dayOfWeekValue == \(day.rawValue)")
        fetchRequest.predicate = predicate
        
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "remindAt", ascending: true)
        ]
        return fetchRequest
    }
    
    public func getReminders(_ dayOfWeek: DayOfWeek) -> [Reminder] {
        do {
            let reminders = try context.fetch(Self.defaultFetchRequest())
            return reminders
        } catch {
            
            print("Error")
            return []
        }
    }
    
    public func clearAll() {
        let reminders: [Reminder] = (try? context.fetch(Reminder.fetchRequest())) ?? []
        
        reminders.forEach { rem in
            context.delete(rem)
        }
    }
}
