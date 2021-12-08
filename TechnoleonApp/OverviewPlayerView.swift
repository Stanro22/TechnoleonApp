//
//  OverviewPlayerView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/8/21.
//

import SwiftUI

struct OverviewPlayerView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @State var expand = false
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: -60, bottom: 10, trailing: 20))
                VStack(alignment: .leading){
                    if loggedInUser.name != nil{
                        Text("Naam:    ")
                            .font(.custom("", size: 14))
                        + Text(loggedInUser.name!)
                            .font(.custom("", size: 14))
                    }
                    else{
                        Text("Naam:")
                            .font(.custom("", size: 14))
                    }
                    if loggedInUser.club != nil {
                        Text("Leeftijd:    ")
                            .font(.custom("", size: 14))
                        + Text(loggedInUser.club!)
                            .font(.custom("", size: 14))
                    }
                    else{
                        Text("Leeftijd:")
                            .font(.custom("", size: 14))
                    }
                    if loggedInUser.club != nil {
                        Text("Positie:    ")
                            .font(.custom("", size: 14))
                        + Text(loggedInUser.club!)
                            .font(.custom("", size: 14))
                    }
                    else{
                        Text("Positie:")
                            .font(.custom("", size: 14))
                    }
                    if loggedInUser.club != nil {
                        Text("Team:    ")
                            .font(.custom("", size: 14))
                        + Text(loggedInUser.club!)
                            .font(.custom("", size: 14))
                    }
                    else{
                        Text("Team:")
                            .font(.custom("", size: 14))
                    }
                    
                }
            }
            .frame(width: 300, height: 80)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
            
            HStack{
                NavigationLink(destination: LatestResultsView()) {
                    VStack{
                        Text("Laatste Resultaten")
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 280, height: 20)
                    .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                    .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                }
                .cornerRadius(15)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
            
            HStack{
                VStack(alignment: .leading){
                    Text("Beste Resultaten")
                        .padding(EdgeInsets(top: -80, leading: -150, bottom: 12, trailing: 15))
                }
            }
            .frame(width: 300, height: 150)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
                        
            
            HStack(alignment: .bottom){
                    NavigationLink(destination: OverviewPlayerView()) {
                        VStack{
                            Image(systemName: "binoculars.fill")
                                .foregroundColor(Color.white)
                            Text("Mijn overzicht")
                                .foregroundColor(Color.white)
                                .font(.custom("", size: 14))
                        }
                        .frame(width: 100, height: 20)
                        .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                        .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                    }
                    .padding(EdgeInsets(top: 150, leading: 0, bottom: 0, trailing: -10))
                    NavigationLink(destination: OverviewPlayerView()) {
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
                    NavigationLink(destination: ProfilePlayerView()) {
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
        .navigationTitle("Overzicht")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}


struct OverviewPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewPlayerView()
    }
}
