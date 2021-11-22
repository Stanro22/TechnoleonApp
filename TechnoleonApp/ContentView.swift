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
        //UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    
    var body: some View {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                OverviewView().tabItem {
                    Image(systemName: "binoculars")
                    Text("Mijn overzicht")
                }.tag(1)
                TestCategoriesView().tabItem {
                    Image(systemName: "globe")
                    Text("Testen")
                }.tag(2)
                ProfileView().tabItem {
                    Image(systemName: "person.circle")
                    Text("Profiel")
                }.tag(3)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
