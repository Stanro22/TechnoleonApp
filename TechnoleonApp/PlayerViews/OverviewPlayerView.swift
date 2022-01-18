//
//  OverviewPlayerView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/8/21.
//

import SwiftUI

struct OverviewPlayerView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var testManager = TestList()
    @State var testList: [OverviewTestItemPlayer]?
    @State var loadingTests: Bool = false
    let colums = [
        GridItem(.fixed(142)),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
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
                        if loggedInUser.teamRole != nil{
                            Text("Positie:    ")
                                .font(.custom("", size: 14))
                            + Text(loggedInUser.teamRole!)
                                .font(.custom("", size: 14))
                        }
                        else{
                            Text("Positie:")
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
                NavigationLink(destination: LatestResultsView()) {
                    VStack{
                        Text("Laatste Resultaten")
                            .foregroundColor(Color.white)
                            .font(.custom("", size: 14))
                    }
                    .frame(width: 280, height: 20)
                    .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                    .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                }
                .cornerRadius(15)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
            
            HStack{
                VStack(alignment: .leading){
                    Text("Resultaten")
                        .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 15))
                    ScrollView{
                        LazyVGrid(columns: colums, spacing: 10){
                            if loggedInUser.testList == nil{
                                ProgressView("")
                                    .onAppear(){
                                        if loggedInUser.userId != nil{
                                            getUserById()
                                        }
                                    }
                            }
                            else{
                                if testList == nil{
                                    ProgressView("Loading tests")
                                        .onAppear(){
                                            setTestListForPlayer()
                                        }
                                }
                                else{
                                    ForEach(testList!, id: \.self) { overviewItem in
                                        VStack{
                                            NavigationLink(destination: TestDetailPlayerView(test: overviewItem.test)) {
                                                Image("ball")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .frame(width: 25, height: 25)
                                                    .foregroundColor(Color.white)
                                                Spacer()
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
                Spacer()
            }
            .frame(width: 300, height: 350)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
            Spacer()
            
            PlayerTabBar(isOverViewActive: true, isTestsActive: false, isProfileActive: false)
        }
        .navigationTitle("Overzicht")
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setTestListForPlayer(){
        for test in loggedInUser.testList!{
            if testList == nil{
                testList = [OverviewTestItemPlayer]()
            }
            let testName = test.getTestName(test: test)
            let result = testList!.filter {$0.name == testName}
            let exists = result.isEmpty == false
            if exists == false{
                let overviewTestItem = OverviewTestItemPlayer(name: testName, test: test)
                self.testList?.append(overviewTestItem)
            }
            loadingTests = true
        }
    }
    
    func getUserById(){
        technoleonAPI.getUserPlayerById(id: loggedInUser.userId!) { (result) in
            switch result {
            case .success(let response):
                loggedInUser.email = response.email
                loggedInUser.birthDate = response.birthDate
                loggedInUser.weightInKg = response.weightInKg
                loggedInUser.lengthInCm = response.lengthInCm
                loggedInUser.gender = response.gender
                loggedInUser.teamRole = response.teamRole
                loggedInUser.teamId = response.teamId
                loggedInUser.testList = response.tests
                loggedInUser.testList!.sort{$0.created! > $1.created!}
                getTeamById(id: response.teamId)
            case .failure(let error):
                switch error{
                case .urlError(let urlError):
                    print("URL error: \(String(describing: urlError))")
                case .decodingError(let decodingError):
                    print("decode error: \(String(describing: decodingError))")
                case .genericError(let error):
                    print("error: \(String(describing: error))")
                }
            }
        }
    }
    
    func getTeamById(id: String){
        technoleonAPI.getTeamById(id: (loggedInUser.teamId)!) { (result) in
            switch result {
            case .success(let response):
                loggedInUser.teamname = response.teamname
                if loggedInUser.userRole == "coach"{
                    loggedInUser.organizationId = response.organizationId
                    loggedInUser.players = response.players
                }
            case .failure(let error):
                switch error{
                case .urlError(let urlError):
                    print("URL error: \(String(describing: urlError))")
                case .decodingError(let decodingError):
                    print("decode error: \(String(describing: decodingError))")
                case .genericError(let error):
                    print("error: \(String(describing: error))")
                }
            }
        }
    }
}


struct OverviewPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewPlayerView()
    }
}
