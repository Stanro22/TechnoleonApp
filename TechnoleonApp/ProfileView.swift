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
                            .font(.custom("", size: 20))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(Color.gray)
                }
                .cornerRadius(10)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                .disabled(true)
                NavigationLink(destination: OverviewView()) {
                    VStack{
                        Text("Teams")
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 20))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                }
                .cornerRadius(10)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                .disabled(true)
            }
            .padding()
                        
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Text("Emailadres")
                        .font(.custom("", size: 14))
                    Spacer()
                    if loggedInUser.email != nil {
                        Text(loggedInUser.email!)
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    else{
                        Text("mail@trainer.com")
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                HStack{
                    Image(systemName: "calendar")
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Text("Geboortejaar")
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    if loggedInUser.email != nil {
                        Text("")
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    else{
                        Text("")
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                HStack{
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Text("Gender")
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 0))
                    Spacer()
                    if loggedInUser.email != nil {
                        Text("Man")
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    else{
                        Text("")
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
            .padding()
            .frame(width: 300, height: 120)
            .background(Color(UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 0.80)))
            Spacer()
            
            Button(action: logout){
                Text("Logout")
            }
            .padding(EdgeInsets(top: 23, leading: 15, bottom: 0, trailing: 15))
            
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
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: -10))
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
                        .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
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
