//
//  ContentView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/18/21.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    
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
                    NavigationLink(destination: OverviewView()) {
                        Button(action: login){
                            Text("Inloggen")
                                .font(.custom("", size: 22))
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                    }.cornerRadius(10)
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
                }
            }
        }
        .navigationTitle("Inloggen")
    }
    
    func login(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
