//
//  EndOfTestView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/25/21.
//

import SwiftUI

struct EndOfTestView: View {
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var testManager = TestManager.shared
    @State private var isExpanded = false
    @State private var selectedPlayer = "Speler"
    
    var body: some View {
        VStack{
            Spacer()
            Text(NSLocalizedString("Select another player", comment: "Select another player"))
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 20, trailing: 15))
            
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
            
            Text(NSLocalizedString("Or", comment: "Or"))
            
            NavigationLink(destination: TestCategoriesView()) {
                Text(NSLocalizedString("Select another test", comment: "Select another test"))
                    .padding()
                    .foregroundColor(Color.white)
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(10)
            
            NavigationLink(destination: getTestView()) {
                Text(NSLocalizedString("Start the test again", comment: "Start the test again"))
                    .padding()
                    .foregroundColor(Color.white)
            }
            .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            .cornerRadius(10)
            .padding(EdgeInsets(top: 80, leading: 15, bottom: 20, trailing: 15))
            
            TrainerTabBar(isOverviewActive: false, isTestsActive: false, isProfileActive: false)
        }
        .navigationTitle(NSLocalizedString("End of Test", comment: "End of Test"))
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
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

struct EndOfTestView_Previews: PreviewProvider {
    static var previews: some View {
        EndOfTestView()
    }
}
