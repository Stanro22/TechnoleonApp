//
//  GiTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct GiTView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var gitManager = GiTRoundManager.shared
    @State var currentRound: Int = 1
    @State var maxRounds: Int = 10
    @State var didOneTapped: Bool = false
    @State var didTwoTapped: Bool = false
    @State var didThreeTapped: Bool = false
    @State var didFourTapped: Bool = false
    @State var didFiveTapped: Bool = false
    @State var didSixTapped: Bool = false

    var body: some View {
        VStack{
            Spacer()
            /*HStack{
                Button(action: {currentRound -= 1}){
                    Text("Vorige ronde")
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                }
                .cornerRadius(5)
                .padding(EdgeInsets(top: 0, leading: 29, bottom: 0, trailing: 0))
                Spacer()
            }*/
            VStack{
                HStack{
                    Button(action: {
                        resetButtonColors()
                        didOneTapped = true
                    }){
                        Text("1")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(didOneTapped ? Color(red: 0.90, green: 0.31, blue: 0.11) : Color(red: 0.38, green: 0.44, blue: 0.64))
                    Button(action: {
                        resetButtonColors()
                        didTwoTapped = true
                    }){
                        Text("2")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(didTwoTapped ? Color(red: 0.90, green: 0.31, blue: 0.11) : Color(red: 0.38, green: 0.44, blue: 0.64))
                    Button(action: {
                        resetButtonColors()
                        didThreeTapped = true
                    }){
                        Text("3")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(didThreeTapped ? Color(red: 0.90, green: 0.31, blue: 0.11) : Color(red: 0.38, green: 0.44, blue: 0.64))
                }
                HStack{
                    Button(action: {
                        resetButtonColors()
                        didFourTapped = true
                    }){
                        Text("4")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(didFourTapped ? Color(red: 0.90, green: 0.31, blue: 0.11) : Color(red: 0.38, green: 0.44, blue: 0.64))
                    Button(action: {
                        resetButtonColors()
                        didFiveTapped = true
                    }){
                        Text("5")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(didFiveTapped ? Color(red: 0.90, green: 0.31, blue: 0.11) : Color(red: 0.38, green: 0.44, blue: 0.64))
                    Button(action: {
                        resetButtonColors()
                        didSixTapped = true
                    }){
                        Text("6")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(didSixTapped ? Color(red: 0.90, green: 0.31, blue: 0.11) : Color(red: 0.38, green: 0.44, blue: 0.64))
                }
            }
            Text("\(currentRound)")
                .font(.custom("", size: 50))
            + Text("/\(maxRounds)")
                .font(.custom("", size: 50))
            Spacer()
            
            if currentRound < maxRounds {
                Button(action: {
                    currentRound += 1
                    resetButtonColors()
                }){
                    Text("Volgende ronde")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                }
                .cornerRadius(10)
            }
            if currentRound == maxRounds {
                NavigationLink(destination: EndOfTestView().onAppear{ }) {
                    Text("Sla gegevens op")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
        }
        .navigationTitle("GiT")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }

    func resetButtonColors(){
        didOneTapped = false
        didTwoTapped = false
        didThreeTapped = false
        didFourTapped = false
        didFiveTapped = false
        didSixTapped = false
    }
}

/*struct GiTView_Previews: PreviewProvider {
    static var previews: some View {
        GiTView()
    }
}*/
