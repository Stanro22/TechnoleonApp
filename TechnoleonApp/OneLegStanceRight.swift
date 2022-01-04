//
//  OneLegStanceRight.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct OneLegStanceRight: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var timerManager = StopwatchManager()
    @ObservedObject var oneLegStanceBody = OneLegStanceRequestBody.shared
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    NavigationLink(destination: OneLegStanceLeft().onAppear{saveTime()}) {
                            VStack{
                                Text("Linkerbeen")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))

                            }
                            .frame(width: 157, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))                    
                        
                    NavigationLink(destination: OneLegStanceRight().onAppear{saveTime()}) {
                            VStack{
                                Text("Rechterbeen")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 158, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .overlay(Rectangle().frame(width: nil, height: 3, alignment: .bottom).foregroundColor(Color.white), alignment: .bottom)
                }
            }
            Spacer()
            
            VStack{
                Text("Aantal seconden volgehouden")
                    .font(.title2)
                Text("Tijd om op te slaan")
                    .font(.custom("", size: 16))
                Text(timerManager.timeToSave)
                    .font(.custom("", size: 16))
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
            
            NavigationLink(destination: EndOfTestView().onAppear{setOneLegStanceTest()}) {
                Text("Sla gegevens op")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0))

        }
        .navigationTitle("One leg stance")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func saveTime(){
        oneLegStanceBody.seconds = "00:\(timerManager.timeToSave)"
    }
    
    func setOneLegStanceTest(){
        saveTime()
        technoleonAPI.setOneLegStanceTestForPlayer(id: loggedInUser.playerId!, OneLegStanceRequestBody: oneLegStanceBody) { (result) in
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

struct OneLegStanceRight_Previews: PreviewProvider {
    static var previews: some View {
        OneLegStanceRight()
    }
}
