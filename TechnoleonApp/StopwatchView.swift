//
//  StopwatchView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/18/22.
//

import SwiftUI

struct StopwatchView: View {
    @ObservedObject var stopwatchManager: StopwatchManager
    
    var body: some View {
        VStack{
            Button(action: stopwatchManager.reset){
                Text("Reset")
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
            }
            .cornerRadius(15)
            
            Text(secondsToMinutesAndSeconds(seconds: Int(stopwatchManager.seconds)))
                .font(.custom("", size: 40))
                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                .frame(width: 180, height: 180)
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
                .padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 0))
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

//struct StopwatchView_Previews: PreviewProvider {
   // static var previews: some View {
    //    StopwatchView()
    //}
//}
