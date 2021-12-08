//
//  ContentView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/18/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    
    var body: some View {
        if technoleonAPI.accesToken == nil{
            NavigationView{
                LoginView()
            }
            .navigationTitle("Inloggen")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
        else {
            if loggedInUser.userRole == "coach" {
                NavigationView{
                    OverviewView()
                }
                .navigationTitle("Overview")
                .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
            }
            else if loggedInUser.userRole == "player" {
                NavigationView{
                    OverviewPlayerView()
                }
                .navigationTitle("Overview")
                .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
            }
            else{
                NavigationView{
                    LoginView()
                }
                .navigationTitle("Inloggen")
                .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
