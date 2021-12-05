//
//  LoginView.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/5/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
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
                    Image(systemName: "star")
                    Image(systemName: "star")
                }
                .padding()
                HStack{
                    TextField("Email adres", text: $email)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 30)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding()
                
                HStack{
                    SecureField("Password", text: $password)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 30)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding()
                
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
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
                }
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
            case .failure(_):
                self.isRequestErrorViewPresented = true
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
