//
//  Sprint10x5mView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct Sprint10x5mView: View {
    @ObservedObject var timerManager = StopwatchManager()
    
    var body: some View {
        VStack{
            Spacer()
            Text("Sprint")
                .font(.title)
            Text("Totale duur in seconden")
                .font(.custom("", size: 16))
            Spacer()
            
            Button(action: timerManager.reset){
                Text("Reset")
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color.red)
            }
            .cornerRadius(15)
            
            Text(secondsToMinutesAndSeconds(seconds: timerManager.seconds))
                .font(.custom("", size: 40))
                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                .frame(width: 180, height: 180)
                .overlay(
                    RoundedRectangle(cornerRadius: 90)
                        .stroke(lineWidth: 3)
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                )
                .onAppear(){
                    self.timerManager.seconds = 0
                }
                
            Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 0))
                .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                .onTapGesture(perform: {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.seconds = 0
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                })
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{ }) {
                Text("Sla gegevens op")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 5, trailing: 0))
        }
        .navigationTitle("10x5 meter sprint")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct Sprint10x5mView_Previews: PreviewProvider {
    static var previews: some View {
        Sprint10x5mView()
    }
}
