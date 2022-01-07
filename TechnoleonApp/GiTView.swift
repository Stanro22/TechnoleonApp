//
//  GiTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct GiTView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var gitManager = GiTRoundManager.shared
    @State var currentRound: Int = 1
    @State var numberOfRounds = 1...10

    var body: some View {
        VStack{
            Spacer()
            GiTRoundView(round: currentRound)
            Spacer()
            
            if currentRound < 10 {
                Button(action: {currentRound += 1}){
                    Text("Volgende ronde")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                }
                .cornerRadius(10)
            }
            if currentRound == 10 {
                NavigationLink(destination: EndOfTestView().onAppear{ }) {
                    Text("Volgende ronde")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
        }
        .navigationTitle("GiT")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        .onAppear(perform: setRounds)
    }
    
    func setRounds(){
        for number in numberOfRounds{
            let gitRound: GiTRound = GiTRound()
            gitRound.id = number
            gitManager.rounds![number] = gitRound
        }
    }
}

/*struct GiTView_Previews: PreviewProvider {
    static var previews: some View {
        GiTView()
    }
}*/
