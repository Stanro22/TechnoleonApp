//
//  LatestResultView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/3/21.
//

import SwiftUI

struct LatestResultsView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Text("Test")
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
                    Spacer()
                    Text("Datum")
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
                }
                
                ScrollView{
                    if loggedInUser.testList == nil {
                        ProgressView("Loading tests")
                    }
                    else{
                        ForEach(loggedInUser.testList!, id: \.self) { test in
                            VStack{
                                NavigationLink(destination: TestDetailPlayerView(test: test)) {
                                    Text("\(test.getTestName(test: test))")
                                        .foregroundColor(Color.white)
                                        .font(.custom("", size: 14))
                                    Spacer()
                                    Text("\(test.created!)")
                                        .foregroundColor(Color.white)
                                        .font(.custom("", size: 14))
                                }
                                .frame(width: 280, height: 20)
                                .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
                                .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                                .cornerRadius(10)
                            }
                        }
                    }
                }
                Spacer()
            }
            .frame(width: 300, height: 500)
            .padding()
            .foregroundColor(Color.white)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
            Spacer()
            
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
                        .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
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
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
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
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
        }
        .navigationTitle("Laatste resultaten")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}


struct LatestResultsView_Previews: PreviewProvider {
    static var previews: some View {
        LatestResultsView()
    }
}
