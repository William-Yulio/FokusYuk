//
//  TodayGoalView.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 22/07/22.
//

import SwiftUI

struct TodayGoalView: View {
    var completed: Bool
    var task: String
    @State private var newTask: String = ""
    @State private var checkCompleted = true
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)], predicate: NSPredicate(format: "isCompleted == %@", NSNumber(value: false))) private var allTasks: FetchedResults<Task>
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)], predicate: NSPredicate(format: "isCompleted == %@", NSNumber(value: true))) var completedTasks: FetchedResults<Task>
    
    
    
    public func saveTask(){
        do{
            let task = Task(context: viewContext)
            task.taskName = newTask
            task.isCompleted = completed
            task.dateCreated = Date()
            try viewContext.save()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    public func checkIsCompleted(_ task: Task){
        task.isCompleted = !task.isCompleted
        do{
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    public func deleteTask(at offsets: IndexSet){
        offsets.forEach{ index in
            let task = allTasks[index]
            viewContext.delete(task)
            do{
                try viewContext.save()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {

            List{
                Section(header: Text("Today's Goals")){
                    ForEach(allTasks){ task in
                        HStack(alignment: .center, spacing: 30){
                            Image(systemName: task.isCompleted
                                  ? "checkmark.circle.fill" : "circle")
                                .font(Font.system(size: 17.0))
                                .foregroundColor(Color(hex: 0xD2A075))
                                .onTapGesture {
                                    checkIsCompleted(task)
                                }
                            Text(task.taskName ?? "")
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                                .foregroundColor(Color(hex: 0xE1E1E1))
                        }
                    }.onDelete(perform: deleteTask)
                    
                }.headerProminence(.increased)
                    .padding()
                    .listRowBackground(Color(hex: 0x5B6263))
                
                HStack {
                    Spacer(minLength: 20)
                    HStack (alignment: .center,
                            spacing: 30) {
                        Button(action: {
                            saveTask()
                        }){
                            Image(systemName: "plus")
                                .font(Font.system(size: 17.0))
                                .foregroundColor(Color(hex: 0xCBCACA))
                        }
                            TextField ("Add New Task", text: $newTask)
                    }  // HSTack
                        .padding([.top,.bottom], 15)
//                    Spacer(minLength: 20)
                }//end of hstack
            
                Section(header: Text("Completed")){
                    ForEach(completedTasks){ task in
                        HStack(alignment: .center, spacing: 30){
                            Image(systemName: task.isCompleted
                                  ? "checkmark.circle.fill" : "circle")
                                .font(Font.system(size: 17.0))
                                .foregroundColor(Color(hex: 0xD2A075))
                                .onTapGesture {
                                    checkIsCompleted(task)
                                }
                            Text(task.taskName ?? "")
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                                .foregroundColor(Color(hex: 0xE1E1E1))
                        }
                    }.onDelete(perform: deleteTask)
                }.headerProminence(.increased)
                    .padding()
                    .listRowBackground(Color(hex: 0x5B6263))
        }//end of list
            
            
        
        
    }
}

struct TodayGoalView_Previews: PreviewProvider {
    static var previews: some View {
        let persistedContainer = CoreDataManager.shared.persistanceContainer
        TodayGoalView(completed: true, task: "Create Core Data").environment(\.managedObjectContext, persistedContainer.viewContext)
//        TodayGoalView(completed: true, task: "Create Core Data")
    }
}
