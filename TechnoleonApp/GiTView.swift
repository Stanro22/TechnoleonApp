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
            /*HStack{
                Button(action: {currentRound -= 1}){
                    Text("Vorige ronde")
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                }
                .cornerRadius(5)
                .padding(EdgeInsets(top: 0, leading: 29, bottom: 0, trailing: 0))
                Spacer()
            }*/
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
                    Text("Sla gegevens op")
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
    }
}

/*struct GiTView_Previews: PreviewProvider {
    static var previews: some View {
        GiTView()
    }
}*/
