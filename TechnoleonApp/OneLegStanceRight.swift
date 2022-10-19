//
//  OneLegStanceRight.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct OneLegStanceRight: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var stopwatchManager = StopwatchManager()
    @ObservedObject var oneLegStanceBody = OneLegStanceRequestBody.shared
    var isFormNotValid: Bool {
        if stopwatchManager.timeToSave.isEmpty {
            return true
        }
        return false
    }
    
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
                Text(stopwatchManager.timeToSave)
                    .font(.custom("", size: 16))
            }
            Spacer()
            
            StopwatchView(stopwatchManager: stopwatchManager)
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
                .disabled(isFormNotValid)
        }
        .navigationTitle("One leg stance")
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func saveTime(){
        oneLegStanceBody.seconds = "00:\(stopwatchManager.timeToSave)"
    }
    
    func setOneLegStanceTest(){
        saveTime()
        technoleonAPI.setOneLegStanceTestForPlayer(id: loggedInUser.player_id!, OneLegStanceRequestBody: oneLegStanceBody) { (result) in
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
