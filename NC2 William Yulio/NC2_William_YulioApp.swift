//
//  NC2_William_YulioApp.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 21/07/22.
//

import SwiftUI

@main
struct NC2_William_YulioApp: App {
    
    let persistanceContainer = CoreDataManager.shared.persistanceContainer
    
    var body: some Scene {
        WindowGroup {
            TodoListView().environment(\.managedObjectContext, persistanceContainer.viewContext)
        }
    }
}

