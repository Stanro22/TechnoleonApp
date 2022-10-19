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
                NavigationLink(destination: {}) {
                    Text("Trainingsadvies")
                        .font(.custom("", size: 16))
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                .disabled(true)
                Spacer()
                NavigationLink(destination: {}) {
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
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
            Spacer()
            
            VStack{
                ScrollView{
                    ForEach(overviewTestItem.players, id: \.self) { player in
                        NavigationLink(destination: TrainerTestDetailPlayerView(test: overviewTestItem.tests.first(where: {$0.playerId == player.player_id})!, playerName: player.player_name!)) {
                            VStack{
                                Text("\(player.player_name!)")
                                    .foregroundColor(Color.black)
                                    .font(.custom("", size: 18))
                            }
                            .frame(width: 200, height: 20)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .background(Color(red: 0.47, green: 1.00, blue: 0.62))
                            .cornerRadius(10)
                        }
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                Spacer()
            }
            .frame(width: 300, height: 450)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            Spacer()
            
            TrainerTabBar(isOverviewActive: false, isTestsActive: false, isProfileActive: false)
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
