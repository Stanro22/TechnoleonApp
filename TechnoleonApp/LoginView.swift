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
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @State var email: String = ""
    @State var password: String = ""
    @State var isRequestErrorViewPresented: Bool = false
    @State var isRegisterRequestErrorViewPresented: Bool = false
    var isFormValid: Bool {
        return email.count >= 3 && password.count >= 3
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    Image("logo1")
                        .resizable()
                        .frame(width: 120, height: 120)
                    Spacer()
                    Image("logo2")
                        .resizable()
                        .frame(width: 120, height: 120)
                    Spacer()
                }
                .padding()
                Spacer()
                HStack{
                    TextField("Email adres", text: $email)
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
        .navigationTitle("Inloggen")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func login(){
        technoleonAPI.login(email: email, password: password) { (result) in
            switch result {
            case .success(let response):
                technoleonAPI.accesToken = response.accesToken
                getLoggedInUser(token: response.accesToken)
            case .failure(_):
                self.isRequestErrorViewPresented = true
            }
        }
    }
    
    func getLoggedInUser(token: String){
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
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
