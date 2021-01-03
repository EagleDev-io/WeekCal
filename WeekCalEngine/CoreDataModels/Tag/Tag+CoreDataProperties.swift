//
//  TagMO+CoreDataProperties.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 3/01/21.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var name: String?
    @NSManaged public var reminder: Reminder?

}

extension Tag : Identifiable {

}
