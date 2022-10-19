//
//  SitAndReachView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct SitAndReachView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var sitAndReachBody = SitAndReachRequestBody()
    @State var attempt1: String = ""
    @State var attempt2: String = ""
    @State var attempt3: String = ""
    var isFormNotValid: Bool {
        if attempt1.count >= 1 && attempt2.count >= 1 && attempt3.count >= 1{
            return false
        }
        return true
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text("Voer gegevens in")
                .font(.title)
                HStack{
                    TextField("Poging 1 (cm)", text: $attempt1)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                
                HStack{
                    TextField("Poging 2 (cm)", text: $attempt2)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                
                HStack{
                    TextField("Poging 3 (cm)", text: $attempt3)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                
                NavigationLink(destination: EndOfTestView().onAppear{setSitAndReachTest()}) {
                    Text("Sla gegevens op")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    .disabled(isFormNotValid)
            
            Spacer()
            }
            .navigationTitle("Sit and reach")
            .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    
    func setSitAndReachBody(){
        if attempt1.count > 0 {
            let attempt1Int = Int(attempt1)
            sitAndReachBody.centimeters = attempt1Int
        }
        else{
            sitAndReachBody.centimeters = 0
        }
        if attempt2.count > 0 {
            let attempt2Int = Int(attempt2)
            if attempt2Int! > sitAndReachBody.centimeters! {
                sitAndReachBody.centimeters = attempt2Int
            }
        }
        if attempt3.count > 0 {
            let attempt3Int = Int(attempt3)
            if attempt3Int! > sitAndReachBody.centimeters! {
                sitAndReachBody.centimeters = attempt3Int
            }
        }
    }
    
    func setSitAndReachTest(){
        setSitAndReachBody()
        technoleonAPI.setSitAndReachTestForPlayer(id: loggedInUser.player_id!, SitAndReachRequestBody: sitAndReachBody) { (result) in
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


struct SitAndReachView_Previews: PreviewProvider {
    static var previews: some View {
        SitAndReachView()
    }
}
