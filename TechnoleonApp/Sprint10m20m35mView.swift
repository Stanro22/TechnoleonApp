//
//  Sprint10m20m35mView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct Sprint10m20m35mView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var timerManager = StopwatchManager()
    @ObservedObject var tenTwentyThirtyFiveSprintBody = TenTwentyThirtyFiveSprintRequestBody()
    @State private var isExpanded = false
    @State private var selectedDistance = "Afstand"
    private var distances = ["10 meter", "20 meter", "35 meter"]
    @State var IsDistanceSelected: Bool = false
    var isFormNotValid: Bool {
        if IsDistanceSelected == true {
            return false
        }
        return true
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text("Kies afstand voor de sprint")
                .font(.title3)
                
            DisclosureGroup("\(selectedDistance)", isExpanded: $isExpanded){
                ScrollView {
                    VStack{
                        ForEach(distances, id: \.self) { distance in
                            Text("\(distance)")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedDistance = distance
                                    IsDistanceSelected = true
                                    withAnimation{
                                        self.isExpanded.toggle()
                                    }
                                }
                        }
                    }
                }.frame(width: 300, height: 150)
            }
            .accentColor(Color(red: 0.90, green: 0.31, blue: 0.11))
            .foregroundColor(Color.black)
            .frame(width: 300)
            .padding(.all)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
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
            
            NavigationLink(destination: EndOfTestView().onAppear{setTenTwentyThirtyFiveTest()}) {
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
        .navigationTitle("10, 20 ,35 meter sprint")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setTenTwentyThirtyFiveTest(){
        setDistance()
        tenTwentyThirtyFiveSprintBody.seconds = "00:\(timerManager.timeToSave)"
        technoleonAPI.setTenTwentyThirtyFiveSprintTestForPlayer(id: loggedInUser.playerId!, tenTwentyThirtyFiveSprintRequestBody: tenTwentyThirtyFiveSprintBody) { (result) in
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
    
    func setDistance(){
        if selectedDistance == "10 meter" {
            tenTwentyThirtyFiveSprintBody.distance = 10
        }
        if selectedDistance == "20 meter" {
            tenTwentyThirtyFiveSprintBody.distance = 20
        }
        if selectedDistance == "35 meter" {
            tenTwentyThirtyFiveSprintBody.distance = 35
        }
    }
}

struct Sprint10m20m35mView_Previews: PreviewProvider {
    static var previews: some View {
        Sprint10m20m35mView()
    }
}
