//
//  ProfilePlayerView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/8/21.
//

import SwiftUI

struct ProfilePlayerView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @State var dateSet: Bool = false
    @State var date: Date?
    
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding()
                    .background(Color.gray)
                if loggedInUser.name != nil {
                    Text(loggedInUser.name!)
                        .font(.custom("", size: 20))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
                }
            }
            .frame(width: 375, height: 200)
            .background(Color(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 0.90)))
                        
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Text("Emailadres")
                        .font(.custom("", size: 14))
                    Spacer()
                    if loggedInUser.email != nil {
                        Text(loggedInUser.email!)
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                HStack{
                    Image(systemName: "calendar")
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Text("Geboortejaar")
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    if dateSet == false{
                        ProgressView("Loading date")
                            .onAppear(){
                                setDate()
                            }
                    }
                    else{
                        Text(date!, style: .date)
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                HStack{
                    Image("gender")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Text("Gender")
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 0))
                    Spacer()
                    if loggedInUser.gender != nil {
                        Text(loggedInUser.gender!)
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                HStack{
                    Image(systemName: "scalemass.fill")
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Text("Gewicht in kg")
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    if loggedInUser.weight_in_kg != nil {
                        Text("\(loggedInUser.weight_in_kg!)")
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                
                HStack{
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Text("Lengte in cm")
                        .font(.custom("", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 0))
                    Spacer()
                    if loggedInUser.height_in_cm != nil {
                        Text("\(loggedInUser.height_in_cm!)")
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 90, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
            .padding()
            .frame(width: 300, height: 200)
            .background(Color(UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 0.80)))
            Spacer()
            
            Button(action: logout){
                Text("Log out")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }
            .cornerRadius(10)
            .padding(EdgeInsets(top: 23, leading: 15, bottom: 0, trailing: 15))
            
            PlayerTabBar(isOverViewActive: false, isTestsActive: false, isProfileActive: true)
        }
        .navigationTitle("Profiel")
        .navigationBarItems(trailing: Image(systemName: "square.and.pencil").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func logout(){
        technoleonAPI.accesToken = nil
    }
    
    func setDate(){
        if loggedInUser.date_of_birth != nil{
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let dateFormat = dateFormatter.date(from: loggedInUser.date_of_birth!)!
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateFormat)
            let finalDate = calendar.date(from: components)
            self.date = finalDate
            dateSet = true
        }
    }
}

struct ProfilePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePlayerView()
    }
}
