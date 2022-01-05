//
//  LSPTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct LSPTView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var lsptBody = LSPTRequestBody()
    @ObservedObject var timerManager = StopwatchManager()
    @State var missedBench: Int = 0
    @State var wrongBench: Int = 0
    @State var missedZone: Int = 0
    @State var touchedPylon: Int = 0
    @State var outsideZonePass: Int = 0
    @State var touchedCMStrip: Int = 0
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("Tijd om op te slaan: \(timerManager.timeToSave)")
                    .font(.custom("", size: 16))
            }
            VStack(){
                Button(action: timerManager.reset){
                    Text("Reset")
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                }
                .cornerRadius(15)
                
                Text(secondsToMinutesAndSeconds(seconds: Int(timerManager.seconds)))
                    .font(.custom("", size: 30))
                    .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                    .frame(width: 130, height: 130)
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
            }
            Spacer()
            
            HStack{
                VStack{
                    Text("Bank gemist")
                        .font(.custom("", size: 11))
                    Button(action: {missedBench += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    
                    Button(action: {missedBench -= 1}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                    Text("\(missedBench)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text("Verkeerde bank")
                        .font(.custom("", size: 11))
                    Button(action: {wrongBench += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {wrongBench -= 1}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                    Text("\(wrongBench)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text("Doelgebied gemist")
                        .font(.custom("", size: 11))
                    Button(action: {missedZone += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {missedZone -= 1}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                    Text("\(missedZone)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
            }
            Spacer()
            
            HStack{
                VStack{
                    Text("Pylon geraakt")
                        .font(.custom("", size: 11))
                    Button(action: {touchedPylon += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {touchedPylon -= 1}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                    Text("\(touchedPylon)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text("Pass buiten doelgebied")
                        .font(.custom("", size: 10))
                    Button(action: {outsideZonePass += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {outsideZonePass -= 1}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                    Text("\(outsideZonePass)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text("Tien cm strip geraakt")
                        .font(.custom("", size: 10))
                    Button(action: {touchedCMStrip += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {touchedCMStrip -= 1}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                    Text("\(touchedCMStrip)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
            }
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{setLSPTTest()}) {
                Text("Sla gegevens op")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
        }
        .navigationTitle("LSPT")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setFields(){
        lsptBody.missedBench = missedBench
        lsptBody.hitWrongTarget = wrongBench
        lsptBody.missedTargetArea = missedZone
        lsptBody.touchedCone = touchedPylon
        lsptBody.passOutsideArea = outsideZonePass
        lsptBody.hitTenCMStrip = touchedCMStrip
        lsptBody.time = "00:\(timerManager.timeToSave)"
        lsptBody.finalTime = "00:\(timerManager.timeToSave)"
        lsptBody.secondsOver = "00:\(timerManager.timeToSave)"
    }
    
    func setLSPTTest(){
        setFields()
        technoleonAPI.setLSPTTestForPlayer(id: loggedInUser.playerId!, LSPTRequestBody: lsptBody) { (result) in
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

struct LSPTView_Previews: PreviewProvider {
    static var previews: some View {
        LSPTView()
    }
}
