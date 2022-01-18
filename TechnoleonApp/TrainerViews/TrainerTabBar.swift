//
//  TrainerTabBar.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/18/22.
//

import SwiftUI

struct TrainerTabBar: View {
    var isOverviewActive: Bool
    var isTestsActive: Bool
    var isProfileActive: Bool
    
    var body: some View {
        HStack(alignment: .bottom){
                NavigationLink(destination: OverviewView()) {
                    VStack{
                        Image(systemName: "binoculars.fill")
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        Text("Overzicht")
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(isOverviewActive ? Color(red: 0.18, green: 0.25, blue: 0.44) : Color(red: 0.15, green: 0.21, blue: 0.40))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                .disabled(isOverviewActive)
            
                NavigationLink(destination: TestCategoriesView()) {
                    VStack{
                        Image("ball")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.white)
                        Text("Testen")
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(isTestsActive ? Color(red: 0.18, green: 0.25, blue: 0.44) : Color(red: 0.15, green: 0.21, blue: 0.40))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                .disabled(isTestsActive)
            
                NavigationLink(destination: ProfileView()) {
                    VStack{
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        Text("Profiel")
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(isProfileActive ? Color(red: 0.18, green: 0.25, blue: 0.44) : Color(red: 0.15, green: 0.21, blue: 0.40))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                .disabled(isProfileActive)
        }
    }
}

//struct TrainerTabBar_Previews: PreviewProvider {
 //   static var previews: some View {
   //     TrainerTabBar()
   // }
//}
