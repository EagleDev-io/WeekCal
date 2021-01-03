//
//  Reminder+CoreDataProperties.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 3/01/21.
//
//

import Foundation
import CoreData


extension Reminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var content: String?
    @NSManaged public var createdAt: Date?
    @NSManaged var dayOfWeekValue: Int64
    @NSManaged var periodicityValue: Int64
    @NSManaged var priorityValue: Int64
    @NSManaged var remindAt: Double
    @NSManaged public var id: UUID?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for tags
extension Reminder {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension Reminder : Identifiable {

}
