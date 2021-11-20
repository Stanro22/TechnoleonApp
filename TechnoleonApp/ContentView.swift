//
//  ContentView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/18/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.white)
    }
    
    var body: some View {
        NavigationView{
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                Text("").tabItem {
                    Image(systemName: "star")
                    Text("Mijn overzicht")
                }.tag(1)
                Text("").tabItem {
                    Image(systemName: "star")
                    Text("Testen")
                }.tag(2)
                Text("").tabItem {
                    Image(systemName: "person")
                    Text("Profiel")
                }.tag(3)
            }
            .navigationTitle("Overzicht")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
