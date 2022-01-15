//
//  OverviewView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/2/21.
//

import SwiftUI

struct OverviewView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var testManager = TestList.shared
    let colums = [
        GridItem(.fixed(142)),
        GridItem(.flexible())
    ]
    @State var testList: [OverviewTestItem]?
    @State var loadingTests: Bool = false
    
    var body: some View {
        VStack(){
            Spacer()
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .background(Color.gray)
                    .frame(width: 75, height: 80, alignment: .leading)

                VStack(alignment: .leading){
                    HStack{
                        if loggedInUser.name != nil{
                            Text("Naam:    ")
                                .font(.custom("", size: 14))
                            + Text(loggedInUser.name!)
                                .font(.custom("", size: 14))
                        }
                        else{
                            Text("Naam:")
                                .font(.custom("", size: 14))
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 1, trailing: 0))
                    
                    HStack{
                        if loggedInUser.teamname != nil {
                            Text("Team:    ")
                                .font(.custom("", size: 14))
                            + Text(loggedInUser.teamname!)
                                .font(.custom("", size: 14))
                        }
                        else{
                            Text("Team:")
                                .font(.custom("", size: 14))
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                }
            }
            .frame(width: 300, height: 80)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
            
            HStack{
                    NavigationLink(destination: TeamOverviewView()) {
                        VStack{
                            Text("Team Overzicht")
                                .foregroundColor(Color.white)
                                .font(.custom("", size: 14))
                        }
                        .frame(width: 240, height: 20)
                        .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                        .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                    }
                    .cornerRadius(15)
            }
            
            HStack{
                VStack(alignment: .leading){
                    Text("Resultaten")
                        .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 15))
                    ScrollView{
                        LazyVGrid(columns: colums, spacing: 10){
                            if loggedInUser.players != nil {
                                ForEach(loggedInUser.players!, id: \.self) { player in
                                    ForEach(player.tests!, id: \.self) { test in
                                        if loadingTests == false {
                                            ProgressView("")
                                                .onAppear(){
                                                    testManager.addToList(test: test, player: player)
                                                    let arraySize = loggedInUser.players!.count
                                                    if player == loggedInUser.players![arraySize - 1]{
                                                        setTestList()
                                                    }
                                                }
                                        }
                                    }
                                }
                            }
                            if testList == nil{
                                ProgressView("Loading tests")
                            }
                            else{
                                ForEach(testList!, id: \.self) { overviewItem in
                                    VStack{
                                        NavigationLink(destination: TestDetailView(overviewTestItem: overviewItem)) {
                                            Text("\(overviewItem.name)")
                                                .foregroundColor(Color.white)
                                                .font(.custom("", size: 14))
                                        }
                                        .frame(width: 110, height: 50)
                                        .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                                        .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .frame(width: 300, height: 350)
            .padding()
            .foregroundColor(Color.white)
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
                    NavigationLink(destination: PlayerSelectionView()) {
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
        .navigationTitle("Overzicht")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setOverview(){
        for player in loggedInUser.players!{
            for test in player.tests!{
                testManager.addToList(test: test, player: player)
                let arraySize = loggedInUser.players!.count
                if player == loggedInUser.players![arraySize - 1]{
                    setTestList()
                }
            }
        }
    }
    
    func setTestList(){
        testList = [OverviewTestItem]()
        if testManager.testListLSPT != nil{
            testManager.testListLSPT!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "LSPT", players: testManager.playerListLSPT! ,tests: testManager.testListLSPT!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListKTK3 != nil{
            testManager.testListKTK3!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "KTK3", players: testManager.playerListKTK3!, tests: testManager.testListKTK3!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListGIT != nil{
            testManager.testListGIT!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "GiT", players: testManager.playerListGIT!, tests: testManager.testListGIT!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListPHV != nil{
            testManager.testListPHV!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "PHV", players: testManager.playerListPHV!, tests: testManager.testListPHV!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListsitAndReach != nil{
            testManager.testListsitAndReach!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "Sit and Reach", players: testManager.playerListsitAndReach!, tests: testManager.testListsitAndReach!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListfatPercentage != nil{
            testManager.testListfatPercentage!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "Fat percentage", players: testManager.playerListfatPercentage!, tests: testManager.testListfatPercentage!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListIJT != nil{
            testManager.testListIJT!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "IJT", players: testManager.playerListIJT!, tests: testManager.testListIJT!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListInsaitJoy != nil{
            testManager.testListInsaitJoy!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "Insait Joy", players: testManager.playerListInsaitJoy!, tests: testManager.testListInsaitJoy!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListShuttleRun != nil{
            testManager.testListShuttleRun!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "Shuttle run", players: testManager.playerListShuttleRun!, tests: testManager.testListShuttleRun!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListOneLegStance != nil{
            testManager.testListOneLegStance!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "One leg stance", players: testManager.playerListOneLegStance!, tests: testManager.testListOneLegStance!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListTVPS3 != nil{
            testManager.testListTVPS3!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "TVPS3", players: testManager.playerListTVPS3!, tests: testManager.testListTVPS3!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListTTest != nil{
            testManager.testListTTest!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "T-Test", players: testManager.playerListTTest!, tests: testManager.testListTTest!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListVFMT != nil{
            testManager.testListVFMT!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "VFMT", players: testManager.playerListVFMT!, tests: testManager.testListVFMT!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testList10x5Sprint != nil{
            testManager.testList10x5Sprint!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "10x5m Sprint", players: testManager.playerList10x5Sprint!, tests: testManager.testList10x5Sprint!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListYoYo != nil{
            testManager.testListYoYo!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "Yo-Yo", players: testManager.playerListYoYo!, tests: testManager.testListYoYo!)
            self.testList?.append(overviewTestItem)
        }
        if testManager.testListTenTwentyThirtyFiveSprint != nil{
            testManager.testListTenTwentyThirtyFiveSprint!.sort{$0.created! > $1.created!}
            let overviewTestItem = OverviewTestItem(name: "10, 20, 35m Sprint", players: testManager.playerListTenTwentyThirtyFiveSprint!, tests: testManager.testListTenTwentyThirtyFiveSprint!)
            self.testList?.append(overviewTestItem)
        }
        loadingTests = true
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
