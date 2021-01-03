//
//  TagsService.swift
//  WeekCalEngine
//
//  Created by Daniel Rojas on 3/01/21.
//

import Foundation

class TagsService {
    
    let coreDataStack: CoreDataStack
    
    private lazy var context = self.coreDataStack.mainContext
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
}
