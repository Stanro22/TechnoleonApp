//
//  PlayerTabBar.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/18/22.
//

import SwiftUI

struct PlayerTabBar: View {
    var isOverViewActive: Bool
    var isTestsActive: Bool
    var isProfileActive: Bool
    
    var body: some View {
        HStack(alignment: .bottom){
                NavigationLink(destination: OverviewPlayerView()) {
                    VStack{
                        Image(systemName: "binoculars.fill")
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        Text(NSLocalizedString("Overview", comment: "Overview"))
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(isOverViewActive ? Color(red: 0.18, green: 0.25, blue: 0.44) : Color(red: 0.15, green: 0.21, blue: 0.40))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                .disabled(isOverViewActive)
            
                NavigationLink(destination: TestCategoriesPlayerView()) {
                    VStack{
                        Image("ball")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.white)
                        Text(NSLocalizedString("Tests", comment: "Tests"))
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 100, height: 20)
                    .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                    .background(isTestsActive ? Color(red: 0.18, green: 0.25, blue: 0.44) : Color(red: 0.15, green: 0.21, blue: 0.40))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                .disabled(isTestsActive)
            
                NavigationLink(destination: ProfilePlayerView()) {
                    VStack{
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        Text(NSLocalizedString("Profile", comment: "Profile"))
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

//struct PlayerTabBar_Previews: PreviewProvider {
   // static var previews: some View {
    //    PlayerTabBar()
    //}
//}
