//
//  ProfileView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/22/21.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    
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
                else{
                    Text("Jan de Groot")
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
                    Text(NSLocalizedString("E-mail", comment: "E-mail"))
                        .font(.custom("", size: 14))
                    Spacer()
                    if loggedInUser.email != nil {
                        Text(loggedInUser.email!)
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    else{
                        Text("mail@trainer.com")
                            .font(.system(size: 14)).italic()
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .frame(width: 280, height: 20, alignment: .leading)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
            .padding()
            .frame(width: 300, height: 50)
            .background(Color(UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 0.80)))
            Spacer()
            
            Button(action: logout){
                Text(NSLocalizedString("Log out", comment: "Log out"))
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }
            .cornerRadius(10)
            .padding(EdgeInsets(top: 23, leading: 15, bottom: 0, trailing: 15))
            
           TrainerTabBar(isOverviewActive: false, isTestsActive: false, isProfileActive: true)
        }
        .navigationTitle(NSLocalizedString("Profile", comment: "Profile"))
        .navigationBarItems(trailing: Image(systemName: "square.and.pencil").foregroundColor(Color.white))
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func logout(){
        technoleonAPI.accesToken = nil
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
