//
//  InsaitJoyPractice.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/31/21.
//

import SwiftUI

struct InsaitJoyPractice: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var insaitJoyBody = InsaitJoyRequestBody.shared
    @State var count: String = ""
    @State var fluency: String = ""
    var isFormNotValid: Bool {
        if count.count >= 1 && fluency.count >= 1 {
            return false
        }
        return true
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text(NSLocalizedString("Fill in the Insait Joy data from the App", comment: "Fill in the Insait Joy data from the App"))
                .font(.title3)
                HStack{
                    TextField(NSLocalizedString("Count", comment: "Count"), text: $count)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                
                HStack{
                    TextField(NSLocalizedString("Fluency", comment: "Fluency"), text: $fluency)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                
                NavigationLink(destination: EndOfTestView().onAppear{setInsaitJoyTest()}) {
                    Text(NSLocalizedString("Save the data", comment: "Save the data"))
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 200, leading: 0, bottom: 5, trailing: 0))
                    .disabled(isFormNotValid)
            }
            .navigationTitle(NSLocalizedString("Insait Joy drill", comment: "Insait Joy drill"))
            .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    
    func setInsaitJoyFields(){
        insaitJoyBody.count = Int(count)
        insaitJoyBody.fluency = Int(fluency)
        if insaitJoyBody.trainingTime == "THIRTY_SECONDS" {
            insaitJoyBody.frequency = insaitJoyBody.count!/30
        }
        if insaitJoyBody.trainingTime == "SIXTY_SECONDS" {
            insaitJoyBody.frequency = insaitJoyBody.count!/60
        }
    }
    
    func setInsaitJoyTest(){
        setInsaitJoyFields()
        technoleonAPI.setInsaitJoyTestForPlayer(id: loggedInUser.player_id!, insaitJoyRequestBody: insaitJoyBody) { (result) in
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

struct InsaitJoyPractice_Previews: PreviewProvider {
    static var previews: some View {
        InsaitJoyPractice()
    }
}
