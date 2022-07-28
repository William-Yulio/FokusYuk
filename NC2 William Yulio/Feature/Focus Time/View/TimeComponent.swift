//
//  TimeComponent.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 27/07/22.
//

import SwiftUI

struct TimeComponent: View {
    @StateObject private var TimerVM = TimerViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack(spacing: 20){
            
            Text("\(TimerVM.time)")
                .font(.system(size: 72))
                .foregroundColor(.white)
                .padding()
                .background(Color(hex: 0x5B6263))
                .cornerRadius(18)
                .alert("Timer is done!", isPresented: $TimerVM.showingAlert){
                    Button("Continue", role: .cancel){
                        
                    }
                }
            
            Slider(value: $TimerVM.minutes, in: 1...10, step: 1)
                .padding()
                .frame(width: 375, height: 44, alignment: .center)
                .disabled(TimerVM.isActive)
                .animation(.easeInOut, value: TimerVM.minutes)
            
            
            
            Button(action: {
                
            }){
                Image(systemName: "speaker.wave.2.fill")
                    .font(Font.system(size: 36.0))
                    .foregroundColor(Color(hex: 0xDCD7C9))
            }
            
            
            Button(action: {
                
//                Error kalau pause angkanya bukan lanjut dari segitu tapi malah kurang semenit
                if TimerVM.isClicked == true {
                    TimerVM.pause()
                }else{
                    TimerVM.start(minutes: TimerVM.minutes)
                }
                
            }){
                Text(TimerVM.isClicked ? "Pause" : "Start")
                    .font(Font.system(size: 17.0))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    
            }
            .frame(width: 281, height: 50)
            .background(Color(hex: 0xDCD7C9))
            .cornerRadius(8)
            
            
            Button(action: {
                TimerVM.reset()
            }){
                Text("Quit")
                    .font(Font.system(size: 17.0))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    
            }
            .frame(width: 281, height: 50)
            .background(Color(hex: 0xDCD7C9))
            .cornerRadius(8)
            

            
        }
        .frame(width: 390)
        .onReceive(timer){ _ in
            TimerVM.updateCountdown()
            
        }
        
    }
}

struct TimeComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimeComponent()
    }
}
