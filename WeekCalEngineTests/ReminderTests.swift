//
//  ReminderTests.swift
//  WeekCalEngineTests
//
//  Created by Daniel Rojas on 2/01/21.
//

import XCTest
@testable import WeekCalEngine

class ReminderTests: XCTestCase {
    
    var coreDataStack: CoreDataStack!
    
    lazy var context = self.coreDataStack.mainContext

    override func setUp() {
        coreDataStack = TestCoreDataStack()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReminderPeriodictyDefaulValueIsWeekly() throws {
        let reminder = Reminder(context: context)
        XCTAssert(reminder.periodicity == .weekly)
    }
    
    func testReminderCreatedAtDateHasDefaultValue() {
        let reminder = Reminder(context: context)
        XCTAssert(reminder.createdAt != nil)
    }
    
    func testReminderCompletedIsFalseByDefault() {
        let reminder = Reminder(context: context)
        XCTAssert(reminder.completed == false)
    }
    
    func testReminderDayOfWeekDefaultIsToday() {
        let today = DayOfWeek(fromDate: Date())
        let reminder = Reminder(context: context)
        XCTAssert(reminder.dayOfWeek == today)
    }
    
    func testCanAddTagsReminder() {
        let reminder = Reminder(context: context)
        let tag = Tag(context: context)
        tag.name = "Tech"
        reminder.addToTags(tag)
        
        XCTAssert(reminder.tags?.count ?? 0 > 0)
    }
    
    func testDayTimeIsFormatted() {
        let dayTime = DayTime(hour: 9, minutes: 5)
        let description = dayTime.description
        XCTAssert(description == "09:05")
        
    }
    
    func testCanCreateReminderWithDailyPeriodicity() {
        let reminder = Reminder(context: context)
        reminder.periodicity = .daily
        XCTAssert(reminder.periodicity == .daily)
    }


}
