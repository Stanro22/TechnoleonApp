//
//  EndOfTestView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/25/21.
//

import SwiftUI

struct EndOfTestView: View {
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @State private var isExpanded = false
    @State private var selectedPlayer = "Speler"
    
    var body: some View {
        VStack{
            Spacer()
            Text("Selecteer een speler")
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
            
            DisclosureGroup("\(selectedPlayer)", isExpanded: $isExpanded){
                ScrollView {
                    VStack{
                        if loggedInUser.players != nil{
                            ForEach(loggedInUser.players!, id: \.self) { player in
                                Text("\(player.playerName)")
                                    .frame(maxWidth: .infinity)
                                    .font(.title3)
                                    .padding(.all)
                                    .onTapGesture {
                                        self.selectedPlayer = player.playerName
                                        loggedInUser.playerId = player.playerId
                                        withAnimation{
                                            self.isExpanded.toggle()
                                        }
                                    }
                            }
                        }
                        else{
                            ForEach(1...20, id: \.self) { num in
                                Text("\(num)")
                                    .frame(maxWidth: .infinity)
                                    .font(.title3)
                                    .padding(.all)
                                    .onTapGesture {
                                        self.selectedPlayer = "Speler"
                                        withAnimation{
                                            self.isExpanded.toggle()
                                        }
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
            .background(Color(red: 0.93, green: 0.93, blue: 0.93))
            Spacer()
            
            Text("Of")
            
            NavigationLink(destination: TestCategoriesView()) {
                Text("Kies andere test")
                    .padding()
                    .foregroundColor(Color.white)
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(10)
            
            NavigationLink(destination: KTK3View()) {
                Text("Start test opnieuw")
                    .padding()
                    .foregroundColor(Color.white)
            }
            .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            .cornerRadius(10)
            .padding(EdgeInsets(top: 80, leading: 15, bottom: 20, trailing: 15))
            .disabled(true)
            
            HStack(alignment: .bottom){
                    NavigationLink(destination: OverviewView()) {
                        VStack{
                            Image(systemName: "binoculars.fill")
                                .foregroundColor(Color.white)
                            Text("Mijn overzicht")
                                .foregroundColor(Color.white)
                                .font(.custom("", size: 14))
                        }
                        .frame(width: 100, height: 20)
                        .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                    NavigationLink(destination: PlayerSelectionView()) {
                        VStack{
                            Image(systemName: "globe")
                                .foregroundColor(Color.white)
                            Text("Testen")
                                .foregroundColor(Color.white)
                                .font(.custom("", size: 14))
                        }
                        .frame(width: 100, height: 20)
                        .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
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
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
        }
        .navigationTitle("Einde test")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct EndOfTestView_Previews: PreviewProvider {
    static var previews: some View {
        EndOfTestView()
    }
}
