//
//  TestDetailView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/11/22.
//

import SwiftUI

struct TestDetailView: View {
    var overviewTestItem: OverviewTestItem
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                NavigationLink(destination: TestDetailView(overviewTestItem: overviewTestItem)) {
                    Text("Trainingsadvies")
                        .font(.custom("", size: 16))
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                .disabled(true)
                Spacer()
                NavigationLink(destination: TestDetailView(overviewTestItem: overviewTestItem)) {
                    Text("Ontwikkeling")
                        .font(.custom("", size: 16))
                        .foregroundColor(Color.black)
                        .frame(width: 120, height: 20)
                        .padding()
                        .background(Color.gray)
                }.cornerRadius(10)
                .disabled(true)
            }
            .frame(width: 300, height: 20)
            Spacer()
            
            VStack{
                ForEach(overviewTestItem.players, id: \.self) { player in
                    NavigationLink(destination: TrainerTestDetailPlayerView(test: overviewTestItem.tests.first(where: {$0.playerId == player.playerId})!, playerName: player.playerName)) {
                        VStack{
                            Text("\(player.playerName)")
                                .foregroundColor(Color.black)
                                .font(.custom("", size: 18))
                        }
                        .frame(width: 200, height: 20)
                        .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                        .background(Color(red: 0.47, green: 1.00, blue: 0.62))
                        .cornerRadius(10)
                    }
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                }
                Spacer()
            }
            .frame(width: 300, height: 480)
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
                    NavigationLink(destination: TestCategoriesView()) {
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
        .navigationTitle("\(overviewTestItem.name)")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

//struct TestDetailView_Previews: PreviewProvider {
 //   static var previews: some View {
   //     TestDetailView()
   // }
//}
