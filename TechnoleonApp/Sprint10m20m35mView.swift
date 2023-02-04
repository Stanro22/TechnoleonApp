//
//  Sprint10m20m35mView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct Sprint10m20m35mView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var stopwatchManager = StopwatchManager()
    @ObservedObject var tenTwentyThirtyFiveSprintBody = TenTwentyThirtyFiveSprintRequestBody()
    @State private var isExpanded = false
    @State private var selectedDistance = NSLocalizedString("Distance", comment: "Distance")
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
            Text(NSLocalizedString("Select the distance", comment: "Select the distance"))
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
            
            Text(NSLocalizedString("Time to save", comment: "Time to save"))
                .font(.custom("", size: 16))
            Text(stopwatchManager.timeToSave)
                .font(.custom("", size: 16))
            StopwatchView(stopwatchManager: stopwatchManager)
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{setTenTwentyThirtyFiveTest()}) {
                Text(NSLocalizedString("Save the data", comment: "Save the data"))
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .disabled(isFormNotValid)
            Spacer()
        }
        .navigationTitle(NSLocalizedString("Sprint3_title", comment: "Sprint3_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setTenTwentyThirtyFiveTest(){
        /*setDistance()
        tenTwentyThirtyFiveSprintBody.seconds = "00:\(stopwatchManager.timeToSave)"
        technoleonAPI.setTenTwentyThirtyFiveSprintTestForPlayer(id: loggedInUser.player_id!, tenTwentyThirtyFiveSprintRequestBody: tenTwentyThirtyFiveSprintBody) { (result) in
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
        }*/
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
