//
//  TechnicalTestList.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import SwiftUI

struct TechnicalTestList: View {
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(destination: FSTView()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("FST")
                                .foregroundColor(Color.black)
                            Text("Dribbelen")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                            .frame(width: 25, height: 25)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 10, height: 20)
                    }
                    .frame(width: 350, height: 50, alignment: .leading)
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                
                NavigationLink(destination: LSPTView()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("LSPT")
                                .foregroundColor(Color.black)
                            Text("Passen")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                            .frame(width: 25, height: 25)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 10, height: 20)
                    }
                    .frame(width: 350, height: 50, alignment: .leading)
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                
                NavigationLink(destination: InsaitJoyView()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Insait Joy")
                                .foregroundColor(Color.black)
                            Text("Balcontrole, passeren")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                            .frame(width: 25, height: 25)
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

struct TechnicalTestList_Previews: PreviewProvider {
    static var previews: some View {
        TechnicalTestList()
    }
}
