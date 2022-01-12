//
//  TrainerTestDetailPlayerView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import SwiftUI

struct TrainerTestDetailPlayerView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    var test: Test
    var playerName: String
    @State var dateSet: Bool = false
    @State var date: Date?
    @State var loadingTest: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Text("Naam:")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.custom("", size: 20))
                    Spacer()
                    Text("\(playerName)")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.custom("", size: 20))
                }
                .frame(width: 300, height: 40)
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 0.62, green: 0.65, blue: 0.90))
                .cornerRadius(20)
                
                HStack{
                    Text("Test date:")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.custom("", size: 14))
                    Spacer()
                        if dateSet == false{
                            ProgressView("Loading date")
                                .onAppear(){
                                    setDate()
                                }
                        }
                        else{
                            Text("\(date!)")
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                                .font(.custom("", size: 14))
                        }
                }
                .frame(width: 300, height: 60)
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 0.62, green: 0.65, blue: 0.90))
                .cornerRadius(20)
            }
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
        .navigationTitle("\(test.getTestName(test: test))")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setDate(){
        if test.created != nil{
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let dateFormat = dateFormatter.date(from: test.created!)!
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateFormat)
            let finalDate = calendar.date(from: components)
            self.date = finalDate
            dateSet = true
        }
    }
}


//struct TrainerTestDetailPlayerView_Previews: PreviewProvider {
 //   static var previews: some View {
 //       TrainerTestDetailPlayerView()
 //   }
//}
