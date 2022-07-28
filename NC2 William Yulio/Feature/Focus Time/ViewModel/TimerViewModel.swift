//
//  TimerViewModel.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 27/07/22.
//

import Foundation
extension TimeComponent{
    final class TimerViewModel: ObservableObject{
        @Published var isActive = false
        @Published var isClicked = false
        @Published var showingAlert = false
        @Published var time: String = "5:00"
        @Published var minutes: Float = 5.0 {
            didSet{
                self.time = "\(Int(minutes)):00"
            }
        }
        
        private var initialTime = 0
        private var endDate = Date()
        
        func start(minutes: Float){
            self.initialTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.isClicked = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
        }
        
        func reset(){
            self.minutes = Float(initialTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00"
        }
        
        func pause(){
            self.isClicked = false
            self.isActive = false
            
        }
        
        func updateCountdown() {
            guard isActive else{ return }
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "0:00"
                self.showingAlert = true
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calender = Calendar.current
            let minutes = calender.component(.minute, from: date)
            let seconds = calender.component(.second, from: date)
            
            self.minutes = Float(minutes)
            self.time = String(format: "%d:%02d", minutes, seconds)
            
        }
        
        
//        func hiddenConditionally(isHidden: Bool) -> some View {
//                isHidden ? AnyView(self.hidden()) : AnyView(self)
//        }
    }
}
