//
//  TeamSelectionView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/23/21.
//

import SwiftUI

struct TeamSelectionView: View {
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var testManager = TestManager.shared
    @State private var isExpanded = false
    @State private var selectedTeam = "Team"
    
    var body: some View {
        VStack{
            Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Text(NSLocalizedString("Select the team", comment: "Select the team"))
                
                DisclosureGroup("\(selectedTeam)", isExpanded: $isExpanded){
                    ScrollView {
                        VStack{
                            ForEach(1...20, id: \.self) { num in
                                Text("\(num)")
                                    .frame(maxWidth: .infinity)
                                    .font(.title3)
                                    .padding(.all)
                                    .onTapGesture {
                                        self.selectedTeam = "Team"
                                        withAnimation{
                                            self.isExpanded.toggle()
                                        }
                                    }
                            }
                        }
                    }.frame(width: 300, height: 150)
                }
                .accentColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                .foregroundColor(Color.black)
                .frame(width: 300)
                .padding(.all)
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                Spacer()
                
                NavigationLink(destination: PlayerSelectionView()) {
                    Text(NSLocalizedString("Select the player", comment: "Select de player"))
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Spacer()
            
                TrainerTabBar(isOverviewActive: false, isTestsActive: false, isProfileActive: false)
            }
            .navigationTitle(NSLocalizedString("Team selection", comment: "Team selection"))
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }

struct TeamSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TeamSelectionView()
    }
}
