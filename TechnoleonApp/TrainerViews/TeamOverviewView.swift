//
//  TeamOverviewView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/3/21.
//

import SwiftUI

struct TeamOverviewView: View {
    //@ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("Team players")
                    .font(.custom("", size: 16))
                ScrollView{
                    ForEach(loggedInUser.players!, id: \.self) { player in
                        HStack{
                            Text("\(player.playerName)")
                                .foregroundColor(Color.black)
                                .font(.custom("", size: 20))
                        }
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .cornerRadius(15)
                    }
                }
                Spacer()
            }
            .frame(width: 300, height: 500)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)

            Spacer()
            TrainerTabBar(isOverviewActive: false, isTestsActive: false, isProfileActive: false)
        }
        .navigationTitle("Team Overzicht")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct TeamOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        TeamOverviewView()
    }
}
