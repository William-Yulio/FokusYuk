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
        @Published var second: Float = 0.0
        @Published var hours: Float = 1.0
        @Published var minutes: Float = 5.0 {
            didSet{
                self.time = "\(Int(minutes)):00"
            }
        }

        private var initialTime = 0
        private var endDate = Date()

        func initialStart(minutes: Float){
            self.initialTime = Int(minutes)

            self.isActive = true
            self.isClicked = true
            self.second = Float(Int(minutes * 60))


        }

        func continueTimer(){
            self.isActive = true
            self.isClicked = true
        }

        func reset(){
            self.minutes = Float(initialTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00"
            self.second = Float(Int(minutes * 60))
            self.isClicked = false
        }

        func pause(){
            self.isClicked = false
            self.isActive = false

        }

        func updateCountdown() {
            guard isActive else{ return }

            let diff = second - 1
            second -= 1

            if diff <= 0 {
                self.isActive = false
                self.time = "0:00"
                self.showingAlert = true
                return
            }


            let minutes = Int(second) / 60
            let seconds = Int(second) % 60
            print(minutes)
            print(seconds)
            self.minutes = Float(minutes)
            self.time = String(format: "%d:%02d", minutes, seconds)

        }
        

        
    }
}
