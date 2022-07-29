//
//  TimeComponent.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 27/07/22.
//

import SwiftUI
import AVKit

struct TimeComponent: View {
    @StateObject private var TimerVM = TimerViewModel()
    @State var audioPlayer: AVAudioPlayer!
    @State var isPlaySong = true
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public func playSong(){
        try!
            AVAudioSession.sharedInstance()
            .setActive(true)
        self.audioPlayer.play()

    }
    public func pauseSong(){
        self.audioPlayer.pause()
        self.isPlaySong = false
        try! AVAudioSession.sharedInstance().setActive(false)
    }
    
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
            
            Slider(value: $TimerVM.minutes, in: 1...60, step: 1)
                .accentColor(Color(hex: 0xDCD7C9))
                .padding()
                .frame(width: 375, height: 44, alignment: .center)
                .disabled(TimerVM.isActive)
                .animation(.easeInOut, value: TimerVM.minutes)
            
            
            
            Button(action: {
                
                if isPlaySong == true{
                    pauseSong()
                }
                else{
                    playSong()
                    isPlaySong.toggle()
                }
                
                
            }){
                if self.isPlaySong == true{
                    Image(systemName: "speaker.wave.2.fill")
                        .font(Font.system(size: 36.0))
                        .foregroundColor(Color(hex: 0xDCD7C9))
                }else{
                    Image(systemName: "speaker.slash.fill")
                        .font(Font.system(size: 36.0))
                        .foregroundColor(Color(hex: 0xDCD7C9))
                }
                
            }
            
            
            Button(action: {
                

                if TimerVM.isClicked == true {
                    TimerVM.pause()
                }else{
                    if TimerVM.minutes <= TimerVM.second{
                        TimerVM.continueTimer()
                    }else{
                        TimerVM.initialStart(minutes: TimerVM.minutes)
                    }
                    
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
        .onAppear {
            
            let sound = Bundle.main.path(forResource: "FokusYukBGSong", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            playSong()
        }
        
    }
}

struct TimeComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimeComponent()
    }
}
