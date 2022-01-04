//
//  ShuttleRunView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct ShuttleRunView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @State var niveau: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            ScrollView{
                if loggedInUser.players != nil{
                    ForEach(loggedInUser.players!, id: \.self) { player in
                        HStack{
                            Text(player.playerName)
                                .font(.custom("", size: 22))
                                .frame(width: 150, height: 80, alignment: .center)
                            Button(action: {}){
                                Image(systemName: "star")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(Color(red: 0.62, green: 0.65, blue: 0.90))
                                    .cornerRadius(10)
                            }
                            Button(action: {}){
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                                    .cornerRadius(10)
                            }
                            TextField("Niveau", text: $niveau)
                                .frame(width: 60, height: 60)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .background(Color(red: 0.90, green: 0.90, blue: 0.90))
                                .cornerRadius(10)
                        }
                        .overlay(Rectangle().frame(width: nil, height: 2, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40)), alignment: .bottom)
                    }
                }                
            }
            Spacer()
            
            HStack{
                NavigationLink(destination: EndOfTestView().onAppear{ }) {
                    Text("Sla gegevens op")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            .frame(width: 380, height: 80)
            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
            
        }
        .navigationTitle("Shuttle run")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct ShuttleRunView_Previews: PreviewProvider {
    static var previews: some View {
        ShuttleRunView()
    }
}
