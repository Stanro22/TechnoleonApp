//
//  EndOfTestView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/25/21.
//

import SwiftUI

struct EndOfTestView: View {
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @State var expand = false
    
    var body: some View {
        VStack{
            Text("Gegevens zijn opgeslagen")
                .padding(EdgeInsets(top: 50, leading: 15, bottom: 20, trailing: 15))
            Text("Selecteer een speler")
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
            
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
            
            Text("Of")
            
            NavigationLink(destination: TestCategoriesView()) {
                Text("Kies andere test")
                    .padding()
                    .foregroundColor(Color.white)
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(10)
            Text("Of")
            
            NavigationLink(destination: TeamSelectionView()) {
                Text("Wissel team")
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
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
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
        .navigationTitle("Einde test")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct EndOfTestView_Previews: PreviewProvider {
    static var previews: some View {
        EndOfTestView()
    }
}
