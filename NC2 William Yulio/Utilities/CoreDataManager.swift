//
//  CoreDataManager.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 25/07/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistanceContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        persistanceContainer = NSPersistentContainer(name: "CoreDataModel")
        persistanceContainer.loadPersistentStores{ description, error in
            if let error = error{
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
