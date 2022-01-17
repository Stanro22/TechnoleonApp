//
//  PlayerSelectionView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/23/21.
//

import SwiftUI

struct PlayerSelectionView: View {
    @ObservedObject var loggedInUser = LoggedInUser.shared
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
                Text("Selecteer een speler")
                
                DisclosureGroup("\(selectedPlayer)", isExpanded: $isExpanded){
                    ScrollView {
                        VStack{
                            if loggedInUser.players != nil{
                                ForEach(loggedInUser.players!, id: \.self) { player in
                                    Text("\(player.playerName)")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedPlayer = player.playerName
                                            loggedInUser.playerId = player.playerId
                                            withAnimation{
                                                self.isExpanded.toggle()
                                            }
                                        }
                                }
                            }
                            else{
                                ForEach(1...20, id: \.self) { num in
                                    Text("\(num)")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedPlayer = "Speler"
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
                    Text("Doe de test")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                Spacer()
            
            
                HStack(alignment: .bottom){
                        NavigationLink(destination: OverviewView()) {
                            VStack{
                                Image(systemName: "binoculars.fill")
                                    .foregroundColor(Color.white)
                                Text("Overzicht")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
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
                            .background(Color(red: 0.18, green: 0.25, blue: 0.44))
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
            .navigationTitle("Speler selectie" )
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    
    func getPlayernames(){
        for i in (0 ..< loggedInUser.players!.count){
            loggedInUser.playerId = loggedInUser.players![i].playerId
            loggedInUser.playerName = loggedInUser.players![i].playerName
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
