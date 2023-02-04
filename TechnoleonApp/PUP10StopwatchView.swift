//
//  PUP10StopwatchView.swift
//  TechnoleonApp
//
//  Created by user220873 on 11/29/22.
//

import SwiftUI

struct PUP10StopwatchView: View {
    @ObservedObject var stopwatchManager: StopwatchManager
    
    var body: some View {
        HStack{
            Button(action: stopwatchManager.reset){
                Text("Reset")
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
            }
            .cornerRadius(15)
            
            Text(secondsToMinutesAndSeconds(seconds: Int(stopwatchManager.seconds)))
                .font(.custom("", size: 30))
                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                .frame(width: 100, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 90)
                        .stroke(lineWidth: 3)
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                )
                .onAppear(){
                    self.stopwatchManager.seconds = 0
                }
                
            Image(systemName: stopwatchManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20))
                .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                .onTapGesture(perform: {
                    if self.stopwatchManager.timerMode == .initial {
                        self.stopwatchManager.seconds = 0
                    }
                    self.stopwatchManager.timerMode == .running ? self.stopwatchManager.pause() : self.stopwatchManager.start()
                })
        }
    }
}
