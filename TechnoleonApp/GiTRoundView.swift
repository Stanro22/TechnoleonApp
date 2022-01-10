//
//  GiTRoundView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/7/22.
//

import SwiftUI

struct GiTRoundView: View {
    @ObservedObject var gitManager = GiTRoundManager.shared
    var round: Int
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Button(action: {}){
                        Text("1")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                    Button(action: {}){
                        Text("2")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                    Button(action: {}){
                        Text("3")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                }
                HStack{
                    Button(action: {}){
                        Text("4")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                    Button(action: {}){
                        Text("5")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                    Button(action: {}){
                        Text("6")
                            .font(.custom("", size: 60))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 100, height: 130)
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
                }
            }
            Text("\(round)")
                .font(.custom("", size: 50))
            + Text("/10")
                .font(.custom("", size: 50))
        }
    }
}

/*struct GiTRoundView_Previews: PreviewProvider {
    static var previews: some View {
        GiTRoundView()
    }
}*/
