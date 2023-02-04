//
//  LSPTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct LSPTView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var lsptBody = LSPTRequestBody()
    @ObservedObject var timerManager = TimerManager()
    @State var missedBench: Int = 0
    @State var wrongBench: Int = 0
    @State var missedZone: Int = 0
    @State var touchedPylon: Int = 0
    @State var outsideZonePass: Int = 0
    @State var touchedCMStrip: Int = 0
    var isFormNotValid: Bool {
        if timerManager.timeToSave.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack{
            Spacer()
            TimerView(timerManager: timerManager, seconds: 300)
            Spacer()
            
            HStack{
                VStack{
                    Text(NSLocalizedString("Missed bench", comment: "Missed bench"))
                        .font(.custom("", size: 11))
                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                        .foregroundColor(Color.white)
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
                    .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                    
                    Button(action: {if missedBench >= 1 {missedBench -= 1}}){
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
                    .padding(EdgeInsets(top: -8, leading: 7, bottom: 0, trailing: 0))
                    Text("\(missedBench)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text(NSLocalizedString("Hit wrong target", comment: "Hit wrong target"))
                        .font(.custom("", size: 11))
                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                        .foregroundColor(Color.white)
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
                    Button(action: {if wrongBench >= 1 {wrongBench -= 1}}){
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
                    Text(NSLocalizedString("Missed target area", comment: "Missed target area"))
                        .font(.custom("", size: 11))
                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                        .foregroundColor(Color.white)
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
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                    Button(action: {if missedZone >= 1 {missedZone -= 1}}){
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
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 7))
                    Text("\(missedZone)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
            .cornerRadius(10)
            Spacer()
            
            HStack{
                VStack{
                    Text(NSLocalizedString("Touched cone", comment: "Touched cone"))
                        .font(.custom("", size: 11))
                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                        .foregroundColor(Color.white)
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
                    .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                    Button(action: {if touchedPylon >= 1 {touchedPylon -= 1}}){
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
                    .padding(EdgeInsets(top: -8, leading: 7, bottom: 0, trailing: 0))
                    Text("\(touchedPylon)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text(NSLocalizedString("Pass outside area", comment: "Pass outside area"))
                        .font(.custom("", size: 11))
                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                        .foregroundColor(Color.white)
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
                    Button(action: {if outsideZonePass >= 1 {outsideZonePass -= 1}}){
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
                    Text(NSLocalizedString("Hit strip", comment: "Hit strip"))
                        .font(.custom("", size: 11))
                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                        .foregroundColor(Color.white)
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
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                    Button(action: {if touchedCMStrip >= 1 {touchedCMStrip -= 1}}){
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
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 7))
                    Text("\(touchedCMStrip)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
            .cornerRadius(10)
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{setLSPTTest()}) {
                Text(NSLocalizedString("Save the data", comment: "Save the data"))
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                .disabled(isFormNotValid)
        }
        .navigationTitle(NSLocalizedString("LSPT_title", comment: "LSPT_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setFields(){
        lsptBody.missedBench = missedBench
        lsptBody.hitWrongTarget = wrongBench
        lsptBody.missedTargetArea = missedZone
        lsptBody.touchedCone = touchedPylon
        lsptBody.passOutsideArea = outsideZonePass
        lsptBody.hitTenCMStrip = touchedCMStrip
        //lsptBody.time = "00:\(timerManager.timeToSave)"
        lsptBody.finalTime = "00:\(timerManager.timeToSave)"
        //lsptBody.secondsOver = "00:\(timerManager.timeToSave)"
    }
    
    func setLSPTTest(){
        setFields()
        technoleonAPI.setLSPTTestForPlayer(id: loggedInUser.player_id!, LSPTRequestBody: lsptBody) { (result) in
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
