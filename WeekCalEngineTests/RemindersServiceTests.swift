//
//  RemindersServiceTests.swift
//  WeekCalEngineTests
//
//  Created by Daniel Rojas on 2/01/21.
//

import XCTest
@testable import WeekCalEngine

class RemindersServiceTests: XCTestCase {
    var remindersService: RemindersService!
    var testCoreDataStack: TestCoreDataStack!
    
    var context: NSManagedObjectContext {
        testCoreDataStack.mainContext
    }
    
    override func setUp() {
        super.setUp()
        testCoreDataStack = TestCoreDataStack()
        remindersService = RemindersService(coreDataStack: testCoreDataStack)
    }
    override func tearDown() {
        super.tearDown()
        testCoreDataStack = nil
        remindersService = nil
    }
    
    private func populate(count: Int) {
        for index in 0..<count {
            remindersService.addReminder("Reminder\(index)")
        }
    }

    func testRetrievesNonEmptyArrayWhenPopulated() {
        populate(count: 10)
        let reminders = remindersService.getReminders(DayOfWeek.today())
        XCTAssert(reminders.count > 0)
        XCTAssert(reminders.count == 10)
    }
    
    func testRemindersAreSortedByDate() {
        let reminder1 = Reminder(context: context)
        reminder1.dayOfWeek = DayOfWeek.today()
        reminder1.content = "Reminder1"
        reminder1.dayTime = DayTime.now()
        
        let reminder2 = Reminder(context: context)
        reminder2.dayOfWeek = DayOfWeek.today()
        reminder2.content = "Reminder2"
        reminder2.dayTime = DayTime.now().adding(timeInterval: 60)
        
        try? context.save()
        
        let reminders = remindersService.getReminders(DayOfWeek.today())
        let first = reminders.first!
        XCTAssert(first.content == reminder1.content)
    }
}
