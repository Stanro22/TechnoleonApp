//
//  CognitiveTestList.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import SwiftUI

struct CognitiveTestList: View {
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(destination: GiTView()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("GiT")
                                .foregroundColor(Color.black)
                            Text("Positioneren")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: GiTInfo())){
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                                .frame(width: 25, height: 25)
                        }

                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 10, height: 20)
                    }
                    .frame(width: 350, height: 50, alignment: .leading)
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            }
        }
    }
}

struct CognitiveTestList_Previews: PreviewProvider {
    static var previews: some View {
        CognitiveTestList()
    }
}
