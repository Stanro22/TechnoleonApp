//
//  FSTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct FSTView: View {
    @ObservedObject var timerManager = StopwatchManager()
    @State var slalomTime: String = "00.00"
    @State var dribbleTime: String = "00.00"
    @State var backwardsTime: String = "00.00"
    @State var figureTime: String = "00.00"
    @State var passingTime: String = "00.00"
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Text("Slalom")
                    Spacer()
                    Text("\(slalomTime)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("Dribbel")
                    Spacer()
                    Text("\(dribbleTime)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("Achterwaarts")
                    Spacer()
                    Text("\(backwardsTime)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("8-figuur")
                    Spacer()
                    Text("\(figureTime)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("Passen")
                    Spacer()
                    Text("\(passingTime)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 230, height: 4, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("Eindtijd")
                    Spacer()
                    Text("\(timerManager.timeToSave)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
            }
            Spacer()
            
            Button(action: timerManager.reset){
                Text("Reset")
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
            }
            .cornerRadius(15)
            
            Text(secondsToMinutesAndSeconds(seconds: Int(timerManager.seconds)))
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
            
            HStack{
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    .onTapGesture(perform: {
                        if self.timerManager.timerMode == .initial {
                            self.timerManager.seconds = 0
                        }
                        self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                    })
                Spacer()
                Button(action: {}){
                    Text("Ronde")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.90))
                }
                .cornerRadius(10)
            }
            .frame(width: 170, height: 50)
                
            
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{ }) {
                Text("Sla gegevens op")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
        }
        .navigationTitle("FST")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct FSTView_Previews: PreviewProvider {
    static var previews: some View {
        FSTView()
    }
}
