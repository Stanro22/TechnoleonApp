//
//  InsaitJoyPractice.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/31/21.
//

import SwiftUI

struct InsaitJoyPractice: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @State var attempt1: String = ""
    @State var attempt2: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Text("Voer de data in ui de Insait Joy App")
                .font(.title3)
                HStack{
                    TextField("Aantal", text: $attempt1)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                
                HStack{
                    TextField("Vloeiendheid", text: $attempt2)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                
                NavigationLink(destination: EndOfTestView().onAppear{ }) {
                    Text("Sla gegevens op")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 200, leading: 0, bottom: 5, trailing: 0))
            }
            .navigationTitle("PHV")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    
    func setPHVTest(){
        /*technoleonAPI.setKTK3TestForPlayer(id: loggedInUser.playerId!, KTK3RequestBody: ktk3Body) { (result) in
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
        }*/
    }
}

struct InsaitJoyPractice_Previews: PreviewProvider {
    static var previews: some View {
        InsaitJoyPractice()
    }
}
