//
//  ProfilePlayerView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/8/21.
//

import SwiftUI

struct ProfilePlayerView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    
    var body: some View {
        VStack{
            Text("Profiel")
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15))
            
            Button(action: logout){
                Text("Logout")
            }
            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
            
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
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    }
                    .padding(EdgeInsets(top: 400, leading: 0, bottom: 0, trailing: -10))
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


struct ProfilePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePlayerView()
    }
}
