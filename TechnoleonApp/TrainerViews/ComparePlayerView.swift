//
//  ComparePlayerView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/3/21.
//

import SwiftUI

struct ComparePlayerView: View {
    @State var expand1 = false
    @State var expand2 = false
    
    var body: some View {
        VStack{
            VStack{
                HStack {
                    Text("Speler 1")
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 180))
                    Image(systemName: expand1 ? "chevron.up" : "chevron.down")
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
                self.expand1.toggle()
            }
            if expand1 {
                //menu items here
            }
            
            VStack{
                HStack {
                    Text("Speler 2")
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 180))
                    Image(systemName: expand2 ? "chevron.up" : "chevron.down")
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
                self.expand2.toggle()
            }
            if expand2 {
                //menu items here
            }
            
            HStack(alignment: .bottom){
                    NavigationLink(destination: ContentView()) {
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
                    .padding(EdgeInsets(top: 400, leading: 0, bottom: 0, trailing: -10))
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
        .navigationTitle("Speler Vergelijken")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct ComparePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ComparePlayerView()
    }
}
