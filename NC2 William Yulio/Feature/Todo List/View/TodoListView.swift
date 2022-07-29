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
            ZStack{
                Color(.init(red: 63, green: 78, blue: 79, alpha: 0)).ignoresSafeArea()
            
                
                VStack{
                    TodayGoalView(completed: false, task: "Create Core Data")
                    
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
            
            }
        .navigationTitle("My Todo List")
        .navigationBarTitleDisplayMode(.large)
//        .navigationBarColor(backgroundColor: .init(red: 63, green: 78, blue: 79, alpha: 0), titleColor: .white)
        .background(Color(hex: 0x2C3639))
        
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
