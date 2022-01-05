//
//  ShuttleRunView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct ShuttleRunView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    
    var body: some View {
        VStack{
            Spacer()
            ScrollView{
                if loggedInUser.players != nil{
                    ForEach(0..<loggedInUser.players!.count){ index in
                        PlayerShuttleRunView(index: index)
                    }
                }                
            }
            Spacer()
            
            HStack{
                NavigationLink(destination: EndOfTestView().onAppear{setShuttleRunTest()}) {
                    Text("Sla gegevens op")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            .frame(width: 380, height: 80)
            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
            
        }
        .navigationTitle("Shuttle run")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setShuttleRunTest(){
        for player in loggedInUser.players!{
            technoleonAPI.setShuttleRunTestForPlayer(id: player.playerId, newLevel: player.playerShuttleRunScore!) { (result) in
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
}

struct ShuttleRunView_Previews: PreviewProvider {
    static var previews: some View {
        ShuttleRunView()
    }
}
