//
//  GiTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct GiTView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: {}){
                    Text("Vorige ronde")
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                }
                .cornerRadius(5)
                .padding(EdgeInsets(top: 0, leading: 29, bottom: 0, trailing: 0))
                Spacer()
            }
            
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
            Text("1")
                .font(.custom("", size: 50))
            + Text("/10")
                .font(.custom("", size: 50))
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{ }) {
                Text("Volgende ronde")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
        }
        .navigationTitle("GiT")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct GiTView_Previews: PreviewProvider {
    static var previews: some View {
        GiTView()
    }
}
