//
//  VetPercentageView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct VetPercentageView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var fatPercentageBody = FatPercentageRequestBody()
    @State var breast: String = ""
    @State var thigh: String = ""
    @State var belly: String = ""
    @State var hip: String = ""
    @State var armPit: String = ""
    @State var shoulderBlade: String = ""
    @State var tricep: String = ""
    var isFormNotValid: Bool {
        if breast.count >= 1 && thigh.count >= 1 && belly.count >= 1 && hip.count >= 1 && armPit.count >= 1 && shoulderBlade.count >= 1 && tricep.count >= 1{
            return false
        }
        return true
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text(NSLocalizedString("Skinfold thickness", comment: "Skinfold thickness"))
                .font(.title2)
            Text(NSLocalizedString("in millimeter", comment: "in millimeter"))
                .font(.custom("", size: 16))
            
            VStack{
                HStack{
                    TextField(NSLocalizedString("Breast thickness", comment: "Breast thickness"), text: $breast)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    TextField(NSLocalizedString("Thigh thickness", comment: "Thigh thickness"), text: $thigh)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    TextField(NSLocalizedString("Belly thickness", comment: "Belly thickness"), text: $belly)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    TextField(NSLocalizedString("Hip thickness", comment: "Hip thickness"), text: $hip)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    TextField(NSLocalizedString("Armpit thickness", comment: "Armpit thickness"), text: $armPit)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    TextField(NSLocalizedString("Shoulderblade thickness", comment: "Shoulderblade thickness"), text: $shoulderBlade)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    TextField(NSLocalizedString("Tricep thickness", comment: "Tricep thickness"), text: $tricep)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
            }            
            Spacer()
                                
            NavigationLink(destination: EndOfTestView().onAppear{setFatPercentageTest()}) {
                Text(NSLocalizedString("Save the data", comment: "Save the data"))
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .disabled(isFormNotValid)
            Spacer()
        }
        .navigationTitle(NSLocalizedString("Fatpercentage_title", comment: "Fatpercentage_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setFatPercantageBody(){
        fatPercentageBody.breastThickness = Int(breast)
        fatPercentageBody.thighThickness = Int(thigh)
        fatPercentageBody.bellyThickness = Int(belly)
        fatPercentageBody.hipThickness = Int(hip)
        fatPercentageBody.armPitThickness = Int(armPit)
        fatPercentageBody.shoulderBladeThickness = Int(shoulderBlade)
        fatPercentageBody.tricepThickness = Int(tricep)
    }
    
    func setFatPercentageTest(){
        setFatPercantageBody()
        technoleonAPI.setFatPercentageTestForPlayer(id: loggedInUser.player_id!, FatPercentageRequestBody: fatPercentageBody) { (result) in
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
struct VetPercentageView_Previews: PreviewProvider {
    static var previews: some View {
        VetPercentageView()
    }
}
