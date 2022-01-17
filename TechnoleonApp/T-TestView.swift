//
//  T-TestView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct T_TestView: View {
    @ObservedObject var timerManager = StopwatchManager()
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var tTestBody = TTestRequestBody()
    var isFormNotValid: Bool {
        if timerManager.timeToSave.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text("T-Test")
                .font(.title)
            Text("Tijd om op te slaan:")
                .font(.custom("", size: 16))
            Text(timerManager.timeToSave)
                .font(.custom("", size: 16))
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
            
            NavigationLink(destination: EndOfTestView().onAppear{setTTestTest()}) {
                Text("Sla gegevens op")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0))
                .disabled(isFormNotValid)
        }
        .navigationTitle("T-Test")
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setTTestBody(){
        tTestBody.seconds = "00:\(timerManager.timeToSave)"
    }
    
    func setTTestTest(){
        setTTestBody()
        technoleonAPI.setTTestTestForPlayer(id: loggedInUser.playerId!, TTestRequestBody: tTestBody) { (result) in
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

struct T_TestView_Previews: PreviewProvider {
    static var previews: some View {
        T_TestView()
    }
}
