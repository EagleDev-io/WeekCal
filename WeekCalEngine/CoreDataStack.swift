//
//  CoreDataStack.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 2/01/21.
//

import CoreData

open class CoreDataStack {
  public static let modelName = "WeekCal"

  public static let model: NSManagedObjectModel = {
    // swiftlint:disable force_unwrapping
    let bundle = Bundle(for: CoreDataStack.self)
    let modelURL = bundle.url(forResource: modelName, withExtension: "momd")!
    return NSManagedObjectModel(contentsOf: modelURL)!
  }()
  // swiftlint:enable force_unwrapping

  public init() {
  }

  public lazy var mainContext: NSManagedObjectContext = {
    return storeContainer.viewContext
  }()

  public lazy var storeContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: CoreDataStack.modelName, managedObjectModel: CoreDataStack.model)
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    return container
  }()

  public func newDerivedContext() -> NSManagedObjectContext {
    let context = storeContainer.newBackgroundContext()
    return context
  }

  public func saveContext() {
    saveContext(mainContext)
  }

  public func saveContext(_ context: NSManagedObjectContext) {
    if context != mainContext {
      saveDerivedContext(context)
      return
    }

    context.perform {
      do {
        try context.save()
      } catch let error as NSError {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }

  public func saveDerivedContext(_ context: NSManagedObjectContext) {
    context.perform {
      do {
        try context.save()
      } catch let error as NSError {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }

      self.saveContext(self.mainContext)
    }
  }
}
