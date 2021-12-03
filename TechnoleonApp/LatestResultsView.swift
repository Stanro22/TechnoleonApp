//
//  LatestResultView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/3/21.
//

import SwiftUI

struct LatestResultView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Test")
                    .font(.custom("", size: 14))
                    .padding(EdgeInsets(top: -230, leading: 0, bottom: 12, trailing: 15))
                Text("Resultaat")
                    .font(.custom("", size: 14))
                    .padding(EdgeInsets(top: -230, leading: 70, bottom: 12, trailing: -20))
                Text("Ontwikkeling")
                    .font(.custom("", size: 14))
                    .padding(EdgeInsets(top: -230, leading: 40, bottom: 12, trailing: 0))
                
            }
            .frame(width: 300, height: 450)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
            
            HStack(alignment: .bottom){
                    NavigationLink(destination: ContentView()) {
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
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: -10))
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
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .navigationTitle("Laatste Resultaten")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}


struct LatestResultView_Previews: PreviewProvider {
    static var previews: some View {
        LatestResultView()
    }
}
