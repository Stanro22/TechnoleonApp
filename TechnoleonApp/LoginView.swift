//
//  LoginView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/5/21.
//

import SwiftUI
import JWTDecode

struct LoginView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @State var email: String = ""
    @State var password: String = ""
    @State var isRequestErrorViewPresented: Bool = false
    @State var isRegisterRequestErrorViewPresented: Bool = false
    
    //Validation
    var isFormValid: Bool {
        return email.count >= 3 && password.count >= 3
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                //Display logo's
                HStack{
                    Spacer()
                    Image("logo_forwardfootball")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                    Image("logo_technoleon")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                .padding()
                Spacer()
                
                HStack{
                    TextField("E-mail", text: $email)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 30)
                        .overlay(Rectangle().frame(width: 290, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding()
                
                HStack{
                    SecureField("Password", text: $password)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 30)
                        .overlay(Rectangle().frame(width: 290, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding()
                Spacer()
                //Button with login action
                HStack{
                    Button(action: login){
                        Text("Inloggen")
                            .font(.custom("", size: 22))
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                    .cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                }
                Spacer()
            }
        }
        //Page title and color
        .navigationTitle("Inloggen")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    //Login with filled in email and password
    func login(){
        //make api call: login
        technoleonAPI.login(email: email, password: password, client_id: "mobile-app") { (result) in
            switch result {
            case .success(let response):
                technoleonAPI.accesToken = response.accesToken //set accestoken
                loggedInUser.email = email //set email from logged in user
                getUserIdByEmail(accesToken: response.accesToken) //call to function getUserIdByEmail
            case .failure(_):
                self.isRequestErrorViewPresented = true
            }
        }
    }
    
    //get the user_id by filled in email
    func getUserIdByEmail(accesToken: String){
        //make api call: getUserIdByEmail
        technoleonAPI.getUserIdByEmail(email: email) { (result) in
            switch result {
            case .success(let response):
                loggedInUser.user_id = response.user_id //set user_id from logged in user
                getUserByUserId(accestoken: accesToken, user_id: response.user_id) //call to function getUserByUserId
            case .failure(let error):
                //set error messages
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
    
    //get all user info with the user_id
    func getUserByUserId(accestoken: String, user_id: String){
        //make api call: getUserByUserId
        technoleonAPI.getUserByUserId(user_id: user_id) { (result) in
            switch result {
            case .success(let response):
                //set logged in user info
                loggedInUser.type = response.type
                loggedInUser.name = response.name
                loggedInUser.gender = response.gender
                loggedInUser.date_of_birth = response.date_of_birth
                loggedInUser.weight_in_kg = response.weight_in_kg
                loggedInUser.height_in_cm = response.height_in_cm
                loggedInUser.player_id = response.player_id
                loggedInUser.coach_clubs = response.coach_clubs
                loggedInUser.teams = response.teams
            case .failure(let error):
                //set error messages
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
        
    /*func getLoggedInUser(token: String){
        if technoleonAPI.accesToken != nil {
            let jwt = try? decode(jwt: token)
            let userId = jwt?.claim(name: "id")
            let userRole = jwt?.claim(name: "roles")
            let name = jwt?.claim(name: "given_name")
            loggedInUser.userId = userId?.string
            loggedInUser.userRole = userRole?.string
            loggedInUser.name = name?.string
            if loggedInUser.userRole == "coach"{
                technoleonAPI.getUserById(id: loggedInUser.userId!) { (result) in
                    switch result {
                    case .success(let response):
                        loggedInUser.email = response.email
                        loggedInUser.teamId = response.teamId
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
    }*/
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
