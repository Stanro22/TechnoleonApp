//
//  OverviewView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/2/21.
//

import SwiftUI

struct OverviewView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    let colums = [
        GridItem(.fixed(142)),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(){
            Spacer()
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .background(Color.gray)
                    .frame(width: 75, height: 80, alignment: .leading)

                VStack(alignment: .leading){
                    HStack{
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
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 1, trailing: 0))
                    
                    HStack{
                        if loggedInUser.teamname != nil {
                            Text("Team:    ")
                                .font(.custom("", size: 14))
                            + Text(loggedInUser.teamname!)
                                .font(.custom("", size: 14))
                        }
                        else{
                            Text("Team:")
                                .font(.custom("", size: 14))
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
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
                    .frame(width: 120, height: 20)
                    .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                    .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                }
                .cornerRadius(15)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    
                    NavigationLink(destination: TeamOverviewView()) {
                        VStack{
                            Text("Team Overzicht")
                                .foregroundColor(Color.white)
                                .font(.custom("", size: 14))
                        }
                        .frame(width: 120, height: 20)
                        .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                        .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                    }
                    .cornerRadius(15)
            }
            
            HStack{
                VStack(alignment: .leading){
                    Text("Laatste Resultaten")
                        .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 15))
                    ScrollView{
                        LazyVGrid(columns: colums, spacing: 10){
                            if loggedInUser.players == nil {
                                ProgressView("Loading players")
                            }
                            else{
                                ForEach(loggedInUser.players!, id: \.self) { player in
                                    if player.tests == nil {
                                        ProgressView("Loading tests")
                                    }
                                    else{
                                        ForEach(player.tests!, id: \.self) { test in
                                            NavigationLink(destination: TeamOverviewView()) {
                                                VStack{
                                                    if test.testName != nil {
                                                        Text("\(test.testName!)")
                                                            .foregroundColor(Color.white)
                                                            .font(.custom("", size: 14))
                                                    }
                                                    else{
                                                        ProgressView("Loading test")
                                                            .onAppear(){
                                                                setTestNames()
                                                            }
                                                    }
                                                }
                                                .frame(width: 110, height: 50)
                                                .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                                                .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                                            }
                                            .cornerRadius(15)
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    //Spacer()
                }
                Spacer()
            }
            .frame(width: 300, height: 350)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
            Spacer()
            
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
                        .background(Color(red: 0.18, green: 0.25, blue: 0.44))
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
        .navigationTitle("Overzicht")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setTestNames(){
        if loggedInUser.players != nil {
            for player in loggedInUser.players!{
                if player.tests != nil{
                    for var test in player.tests!{
                        test.setTestName()
                        //print("\(test.testName)")
                    }
                }
            }
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
