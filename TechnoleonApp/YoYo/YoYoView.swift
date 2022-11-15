//
//  YoYoView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct YoYoView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    
    var body: some View {
        VStack{
            Spacer()
            ScrollView{
                if loggedInUser.teams![0].players != nil{
                    ForEach(0..<loggedInUser.teams![0].players!.count){ index in
                        PlayerYoYoView(index: index)
                    }
                }
            }
            Spacer()
            
            HStack{
                NavigationLink(destination: EndOfTestView().onAppear{ }) {
                    Text(NSLocalizedString("Save the data", comment: "Save the data"))
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
        .navigationTitle(NSLocalizedString("YYIRT_title", comment: "YYIRT_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setYoYoTest(){
        for player in loggedInUser.teams![0].players!{
            technoleonAPI.setYoYoTestForPlayer(id: player.player_id!, newLevel: player.playerYoYoScore!) { (result) in
                switch result {
                case .success(_):
                    print("SUCCES")
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

struct YoYoView_Previews: PreviewProvider {
    static var previews: some View {
        YoYoView()
    }
}
