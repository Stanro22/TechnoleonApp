//
//  FSTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct FSTView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var fstBody = FSTRequestBody()
    @ObservedObject var timerManager = StopwatchManager()
    @ObservedObject var slalomManager = StopwatchManager()
    @ObservedObject var dribbleManager = StopwatchManager()
    @ObservedObject var backwardsManager = StopwatchManager()
    @ObservedObject var figureManager = StopwatchManager()
    @ObservedObject var passManager = StopwatchManager()
    @State var round: Int = 0
    var isFormNotValid: Bool {
        if timerManager.timeToSave.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Text("Slalom")
                    Spacer()
                    Text("\(slalomManager.timeToSave)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("Dribbel")
                    Spacer()
                    Text("\(dribbleManager.timeToSave)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("Achterwaarts")
                    Spacer()
                    Text("\(backwardsManager.timeToSave)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("8-figuur")
                    Spacer()
                    Text("\(figureManager.timeToSave)")
                }
                .frame(width: 200, height: 30)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                HStack{
                    Text("Passen")
                    Spacer()
                    Text("\(passManager.timeToSave)")
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
            
            Button(action: resetTimes){
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
                            self.slalomManager.seconds = 0
                        }
                        self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                        if self.timerManager.timerMode == .running {
                            self.slalomManager.start()
                        }
                    })
                Spacer()
                Button(action: {setTableTimes()}){
                    Text("Ronde")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.90))
                }
                .cornerRadius(10)
            }
            .frame(width: 170, height: 50)
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{setFSTTest()}) {
                Text("Sla gegevens op")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                .disabled(isFormNotValid)
        }
        .navigationTitle("FST")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setTableTimes(){
        self.round += 1
        if round == 1 {
            self.slalomManager.pause()
            self.dribbleManager.start()
        }
        if round == 2 {
            self.dribbleManager.pause()
            self.backwardsManager.start()
        }
        if round == 3 {
            self.backwardsManager.pause()
            self.figureManager.start()
        }
        if round == 4 {
            self.figureManager.pause()
            self.passManager.start()
        }
        if round == 5 {
            self.passManager.pause()
            self.timerManager.pause()
        }
    }
    
    func resetTimes(){
        timerManager.reset()
        slalomManager.reset()
        dribbleManager.reset()
        backwardsManager.reset()
        figureManager.reset()
        passManager.reset()
        self.round = 0
    }
    
    func setFSTBody(){
        fstBody.slalomTime = "00:\(slalomManager.timeToSave)"
        fstBody.dribbletime = "00:\(dribbleManager.timeToSave)"
        fstBody.backwardTime = "00:\(backwardsManager.timeToSave)"
        fstBody.figureTime = "00:\(figureManager.timeToSave)"
        fstBody.passingTime = "00:\(passManager.timeToSave)"
        fstBody.goalPostMiss = "GOAL"
    }
    
    func setFSTTest(){
        setFSTBody()
        technoleonAPI.setFSTTestForPlayer(id: loggedInUser.playerId!, FSTRequestBody: fstBody) { (result) in
            switch result {
            case .success(_):
                print("SUCCES")
            case .failure(let error):
                switch error{
                case .urlError(let urlError):
                    print("URL error: \(String(describing: urlError))")
                case .decodingError(let decodingError):
                    print("decode error: \(String(describing: decodingError))")
                case .genericError(let error):
                    print("error: \(String(describing: error))")
                }
            }
        }
    }
}

struct FSTView_Previews: PreviewProvider {
    static var previews: some View {
        FSTView()
    }
}
