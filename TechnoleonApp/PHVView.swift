//
//  PHVView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct PHVView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var phvBody = PHVRequestBody()
    @State var length: String = ""
    @State var sitHeight: String = ""
    @State var weight: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Text("Voer gegevens in")
                .font(.title)
                HStack{
                    TextField("Lengte (cm)", text: $length)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                
                HStack{
                    TextField("Zithoogte (cm)", text: $sitHeight)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                
                HStack{
                    TextField("Gewicht (kg)", text: $weight)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                
                NavigationLink(destination: EndOfTestView().onAppear{setPHVTest()}) {
                    Text("Sla gegevens op")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
            Spacer()
            }
            .navigationTitle("PHV")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    
    func setPHVBody(){
        if length.count > 0 {
            let lenghtInt = Int(length)
            phvBody.lengthCM = lenghtInt
        }
        else{
            phvBody.lengthCM = 0
        }
        if sitHeight.count > 0 {
            let sitHeightInt = Int(sitHeight)
            phvBody.sitHeightCM = sitHeightInt
        }
        else{
            phvBody.sitHeightCM = 0
        }
        if weight.count > 0 {
            let weightInt = Int(weight)
            phvBody.weightKG = weightInt
        }
        else{
            phvBody.weightKG = 0
        }
    }
    
    func setPHVTest(){
        setPHVBody()
        technoleonAPI.setPHVTestForPlayer(id: loggedInUser.playerId!, PHVRequestBody: phvBody) { (result) in
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

struct PHVView_Previews: PreviewProvider {
    static var previews: some View {
        PHVView()
    }
}
