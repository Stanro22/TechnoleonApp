//
//  LatestResultView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/3/21.
//

import SwiftUI

struct LatestResultsView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Text(NSLocalizedString("Test", comment: "Test"))
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
                    Spacer()
                    Text(NSLocalizedString("Date", comment: "Date"))
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
                }
                
                ScrollView{
                    if loggedInUser.testList == nil {
                        ProgressView(NSLocalizedString("Loading tests", comment: "Loading tests"))
                    }
                    else{
                        ForEach(loggedInUser.testList!, id: \.self) { test in
                            VStack{
                                NavigationLink(destination: TestDetailPlayerView(test: test)) {
                                    Text("\(test.getTestName(test: test))")
                                        .foregroundColor(Color.white)
                                        .font(.custom("", size: 14))
                                    Spacer()
                                    Text("\(setDate(test: test), style: .date)")
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
            
            PlayerTabBar(isOverViewActive: false, isTestsActive: false, isProfileActive: false)
        }
        .navigationTitle(NSLocalizedString("Latest Results", comment: "Latest Results"))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setDate(test: Test) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormat = dateFormatter.date(from: test.created!)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateFormat)
        let finalDate = calendar.date(from: components)
        return finalDate!
    }
}


struct LatestResultsView_Previews: PreviewProvider {
    static var previews: some View {
        LatestResultsView()
    }
}
