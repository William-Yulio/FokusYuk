//
//  PickerComponent.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 27/07/22.
//

import SwiftUI

struct PickerComponent: View {
    
    @State var selection: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)], predicate: NSPredicate(format: "isCompleted == %@", NSNumber(value: false))) private var allTasks: FetchedResults<Task>
    
    
    var body: some View {
        
        Picker("Select a task...",
               
            selection: $selection){
            ForEach(allTasks){ task in
                Text(task.taskName ?? "")
                .fontWeight(.semibold)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                
            }
            }
            .frame(width: 281, height: 57, alignment: .center)
            .foregroundColor(Color(hex: 0xE1E1E1))
            .background(Color(hex: 0x5B6263))
            .cornerRadius(18)
    }
}

struct PickerComponent_Previews: PreviewProvider {
    static var previews: some View {
        PickerComponent()
    }
}
