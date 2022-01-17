//
//  PlayerShuttleRunAndYoYoView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/5/22.
//

import SwiftUI

struct PlayerShuttleRunView: View {
    var index: Int
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @State var niveau = ""
    @State var didInjuryTapped: Bool = false
    @State var buttonColor: Color = Color(red: 0.62, green: 0.65, blue: 0.90)
    
    var body: some View {
        HStack{
            Text(loggedInUser.players![index].playerName)
                .font(.custom("", size: 22))
                .frame(width: 150, height: 80, alignment: .center)
            Button(action: {
                if buttonColor == Color(red: 0.62, green: 0.65, blue: 0.90){
                    buttonColor = Color(red: 0.91, green: 0.92, blue: 0.31)
                } else if buttonColor == Color(red: 0.91, green: 0.92, blue: 0.31){
                    buttonColor = Color(red: 0.73, green: 0.05, blue: 0.05)
                } else{
                    buttonColor = Color(red: 0.62, green: 0.65, blue: 0.90)
                }
            }){
                Image("warning")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(buttonColor)
                    .cornerRadius(10)
            }
            
            Button(action: {
                if didInjuryTapped == false{
                    didInjuryTapped = true
                }
                else{
                    didInjuryTapped = false
                }
            }) {
                Image("injury")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    .cornerRadius(10)
            }
            TextField("Niveau", text: $niveau)
                .frame(width: 60, height: 60)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                .background(Color(red: 0.90, green: 0.90, blue: 0.90))
                .cornerRadius(10)
                .onChange(of: niveau){ newValue in
                    loggedInUser.players![index].playerShuttleRunScore = Int(niveau)
                }
                .disabled(didInjuryTapped)
        }
        .overlay(Rectangle().frame(width: nil, height: 2, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40)), alignment: .bottom)
    }
}

/*struct PlayerShuttleRunAndYoYoView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerShuttleRunAndYoYoView()
    }
}*/
