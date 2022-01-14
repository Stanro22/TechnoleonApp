//
//  GiTRoundView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/7/22.
//

import SwiftUI

struct GiTRoundView: View {
    var round: Int
    var maxRounds: Int
    @ObservedObject var gitManager = GiTRoundManager.shared
    
    @State var didOneTapped: Bool = false
    @State var didTwoTapped: Bool = false
    @State var didThreeTapped: Bool = false
    @State var didFourTapped: Bool = false
    @State var didFiveTapped: Bool = false
    @State var didSixTapped: Bool = false
    
    var body: some View {
        VStack{
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
            Text("\(round)")
                .font(.custom("", size: 50))
            + Text("/\(maxRounds)")
                .font(.custom("", size: 50))
        }
    }
    
    func resetButtonColors(){
        self.didOneTapped = false
        self.didTwoTapped = false
        self.didThreeTapped = false
        self.didFourTapped = false
        self.didFiveTapped = false
        self.didSixTapped = false
    }
}

/*struct GiTRoundView_Previews: PreviewProvider {
    static var previews: some View {
        GiTRoundView()
    }
}*/
