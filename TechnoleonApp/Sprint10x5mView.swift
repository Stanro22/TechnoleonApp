//
//  Sprint10x5mView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct Sprint10x5mView: View {
    @ObservedObject var stopwatchManager = StopwatchManager()
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var sprint10x5Body = Sprint10x5RequestBody()
    var isFormNotValid: Bool {
        if stopwatchManager.timeToSave.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("Sprint")
                    .font(.title)
                Text("Totale duur in seconden")
                    .italic()
            }
            Spacer()
            VStack{
                Text("Tijd om op te slaan:")
                    .font(.custom("", size: 16))
                Text(stopwatchManager.timeToSave)
                    .font(.custom("", size: 16))
            }
            Spacer()
            
            StopwatchView(stopwatchManager: stopwatchManager)
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{setSprint10x5Test()}) {
                Text("Sla gegevens op")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 5, trailing: 0))
                .disabled(isFormNotValid)
        }
        .navigationTitle("10x5 meter sprint")
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setSprint10x5Body(){
        sprint10x5Body.seconds = "00:\(stopwatchManager.timeToSave)"
    }
    
    func setSprint10x5Test(){
        setSprint10x5Body()
        technoleonAPI.setSprint10x5TestForPlayer(id: loggedInUser.player_id!, Sprint10x5RequestBody: sprint10x5Body) { (result) in
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

struct Sprint10x5mView_Previews: PreviewProvider {
    static var previews: some View {
        Sprint10x5mView()
    }
}
