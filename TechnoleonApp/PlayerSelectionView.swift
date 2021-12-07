//
//  PlayerSelectionView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/23/21.
//

import SwiftUI

struct PlayerSelectionView: View {
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @State var playerName = ""
    @State var expand = false
    
    var body: some View {
            VStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    .padding(EdgeInsets(top: 150, leading: 0, bottom: 0, trailing: 0))
                Text("Selecteer een speler")
                
                VStack() {
                    HStack(spacing: 50) {                        
                        if loggedInUser.playerName != nil {
                            Text((loggedInUser.playerName)!)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 90))
                                .foregroundColor(Color.black)
                        }
                        else{
                            Text("Speler")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 150))
                                .foregroundColor(Color.gray)
                        }
                        Image(systemName: expand ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 13, height: 6, alignment: .trailing)
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                    }
                }
                .onAppear(){
                    getPlayernames()
                }
                .padding()
                .frame(width: 300, height: 50)
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .onTapGesture {
                    self.expand.toggle()
                }
                if expand {
                    //menu items here
                }
                
                NavigationLink(destination: TestCategoriesView()) {
                    Text("Kies categorie")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 185, leading: 0, bottom: 50, trailing: 0))
                
                HStack(alignment: .bottom){
                        NavigationLink(destination: OverviewView()) {
                            VStack{
                                Image(systemName: "binoculars.fill")
                                    .foregroundColor(Color.white)
                                Text("Overzicht")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -10))
                        NavigationLink(destination: TeamSelectionView()) {
                            VStack{
                                Image(systemName: "globe")
                                    .foregroundColor(Color.white)
                                Text("Testen")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -10))
                        NavigationLink(destination: ProfileView()) {
                            VStack{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(Color.white)
                                Text("Profiel")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .navigationTitle("Speler selectie" )
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    
    func getPlayernames(){
        for i in (0 ..< loggedInUser.players!.count){
            loggedInUser.playerId = loggedInUser.players![i].playerId
            loggedInUser.playerName = loggedInUser.players![i].playerName
        }
    }
}

struct PlayerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelectionView()
    }
}
