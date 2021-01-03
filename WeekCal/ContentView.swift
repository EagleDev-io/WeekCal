//
//  ContentView.swift
//  WeekCal
//
//  Created by Daniel Rojas on 2/01/21.
//

import SwiftUI
import WeekCalEngine
import CoreData

struct ContentView: View {
    let remindersService: RemindersService
    
    init(service: RemindersService) {
        self.remindersService = service
    }
    
//    @Environment(\.managedObjectContext)
//    var moc: NSManagedObjectContext

    @FetchRequest(fetchRequest: RemindersService.defaultFetchRequest())
    var reminders: FetchedResults<Reminder>
    
    var body: some View {
        VStack {
            List {
                ForEach(reminders, id: \.id) { (reminder: Reminder) in
                    let text = reminder.content ?? ""
                    Text("\(text) \(reminder.dayOfWeek.description)")
                }
            }
            HStack {
                Button("Add") {
                    let reminders = [
                        "Read hacker news",
                        "Read email",
                        "Do laundry",
                        "Do Rust exercises",
                        "Check linkedin",
                        "Update github repos",
                        "Backup homelab",
                        "Check homelab health",
                    ]
                    
                    let content = reminders.randomElement()!
                    remindersService.addReminder(content)
                }
                Button("Clear") {
                    remindersService.clearAll()

                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let coreDataStack = TestCoreDataStack()
        let service = RemindersService(coreDataStack: coreDataStack)
        service.addReminder("Do stuff")
        return ContentView(service: service)
    }
}
