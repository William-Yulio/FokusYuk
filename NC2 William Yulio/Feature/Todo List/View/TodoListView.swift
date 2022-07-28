//
//  ContentView.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 21/07/22.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                TodayGoalView(completed: false, task: "Create Core Data")
                
//                CompletedView(completed: true, task: "Revisi Bab 2")
                
                NavigationLink(destination: FocusTimeView(), label: {
                    Text("Start to Focus")
                        .foregroundColor(.black)
                        .font(.system(size:17.0))
                        .fontWeight(.semibold)
                        .frame(width: 157, height: 50)
                        .background(Color(hex: 0xDCD7C9))
                        .cornerRadius(8)
                        .padding()
                })
                
            }
            .navigationTitle("My Todo List")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarColor(backgroundColor: .purple, titleColor: .white)
            .background(Color(hex: 0x2C3639))
            
            
            
            
        }
       
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
