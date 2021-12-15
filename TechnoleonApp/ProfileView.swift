//
//  ProfileView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/22/21.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding()
                    .background(Color.gray)
                if loggedInUser.name != nil {
                    Text(loggedInUser.name!)
                        .font(.custom("", size: 20))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
                }
                else{
                    Text("Jan de Groot")
                        .font(.custom("", size: 20))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
                }
                
            }
            .frame(width: 375, height: 200)
            .background(Color(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 0.90)))
            
            HStack{
                NavigationLink(destination: OverviewView()) {
                    VStack{
                        Text("Doelen")
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(Color.gray)
                }
                .cornerRadius(10)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                NavigationLink(destination: OverviewView()) {
                    VStack{
                        Text("Teams")
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                }
                .cornerRadius(10)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            }
            .padding()
                        
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "star")
                    Text("Emailadres")
                    Text("")
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                
                HStack{
                    Image(systemName: "star")
                    Text("Geboortejaar")
                    Text("")
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                
                HStack{
                    Image(systemName: "star")
                    Text("Gender")
                    Text("")
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
            }
            .padding()
            .frame(width: 300, height: 120)
            .background(Color(UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 0.80)))
            
            
            Button(action: logout){
                Text("Logout")
            }
            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
            
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
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: -10))
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
                        .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .navigationTitle("Profiel")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func logout(){
        technoleonAPI.accesToken = nil
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
