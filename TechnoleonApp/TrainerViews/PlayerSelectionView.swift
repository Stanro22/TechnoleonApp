//
//  PlayerSelectionView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/23/21.
//

import SwiftUI

struct PlayerSelectionView: View {
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var testManager = TestManager.shared
    @State private var isExpanded = false
    @State private var selectedPlayer = "Speler"
    
    var body: some View {
        VStack{
            Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Text(NSLocalizedString("Select the player", comment: "Select the player"))
                
                DisclosureGroup("\(selectedPlayer)", isExpanded: $isExpanded){
                    ScrollView {
                        VStack{
                            if loggedInUser.teams![0].players != nil{
                                ForEach(loggedInUser.teams![0].players!, id: \.self) { player in
                                    Text("\(player.player_name!)")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedPlayer = player.player_name!
                                            loggedInUser.player_id = player.player_id
                                            withAnimation{
                                                self.isExpanded.toggle()
                                            }
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
                                
                NavigationLink(destination: getTestView()) {
                    Text(NSLocalizedString("Do the test", comment: "Do the test"))
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Spacer()
            
                TrainerTabBar(isOverviewActive: false, isTestsActive: false, isProfileActive: false)
            }
            .navigationTitle(NSLocalizedString("Player selection", comment: "Player selection"))
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    
    func getPlayernames(){
        for i in (0 ..< loggedInUser.teams![0].players!.count){
            loggedInUser.player_id = loggedInUser.teams![0].players![i].player_id
            loggedInUser.teams![0].players![i].player_name = loggedInUser.teams![0].players![i].player_name
        }
    }
    
    func getTestView() -> AnyView{
        if testManager.isKTK3set == true{
            return AnyView(KTK3View())
        }
        if testManager.isPHVset == true{
            return AnyView(PHVView())
        }
        if testManager.isSitAndReachset == true{
            return AnyView(SitAndReachView())
        }
        if testManager.isFatPercentageset == true{
            return AnyView(VetPercentageView())
        }
        if testManager.isTTestset == true{
            return AnyView(T_TestView())
        }
        if testManager.isOneLegStanceset == true{
            return AnyView(OneLegStanceLeft())
        }
        if testManager.isTenTwentyThirtyFiveset == true{
            return AnyView(Sprint10m20m35mView())
        }
        if testManager.isTenxFiveset == true{
            return AnyView(Sprint10x5mView())
        }
        if testManager.isShuttleRunset == true{
            return AnyView(ShuttleRunView())
        }
        if testManager.isYoYoset == true{
            return AnyView(YoYoView())
        }
        if testManager.isFSTset == true{
            return AnyView(FSTView())
        }
        if testManager.isLSPTset == true{
            return AnyView(LSPTView())
        }
        if testManager.isInsaitJoyset == true{
            return AnyView(InsaitJoyView())
        }
        if testManager.isGiTset == true{
            return AnyView(GiTView())
        }
        return AnyView(TestCategoriesView())
    }
}

struct PlayerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelectionView()
    }
}
