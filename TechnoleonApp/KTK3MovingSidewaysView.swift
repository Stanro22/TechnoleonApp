//
//  KTK3MovingSidewaysView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/24/21.
//

import SwiftUI

struct KTK3MovingSidewaysView: View {
    @State var attempt1: String = ""
    @State var attempt2: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 0){
                        NavigationLink(destination: KTK3View()) {
                            VStack{
                                Text("Zijwaarts")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                                Text("springen")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 70, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                        NavigationLink(destination: KTK3MovingSidewaysView()) {
                            VStack{
                                Text("Zijwaarts")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                                Text("bewegen")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 70, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .overlay(Rectangle().frame(width: nil, height: 3, alignment: .bottom).foregroundColor(Color.white), alignment: .bottom)
                            
                        NavigationLink(destination: KTK3Balk1View()) {
                            VStack{
                                Text("Balk 1")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 70, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                        NavigationLink(destination: KTK3Balk2View()) {
                            VStack{
                                Text("Balk 2")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 70, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                        NavigationLink(destination: KTK3Balk3View()) {
                            VStack{
                                Text("Balk 3")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 60, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                        NavigationLink(destination: KTK3HandEyeView()) {
                            VStack{
                                Text("Hand-oog")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 70, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                }
                
                HStack{
                    TextField("Poging 1", text: $attempt1)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 250, height: 30)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                    Button(action: injury) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                            .frame(width: 40, height: 40)
                    }
                    .cornerRadius(5)
                    .padding()
                }
                
                HStack{
                    TextField("Poging 2", text: $attempt2)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 250, height: 30)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                    Button(action: injury) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                            .frame(width: 40, height: 40)
                    }
                    .cornerRadius(5)
                    .padding()
                }
                .padding(EdgeInsets(top: -15, leading: 0, bottom: 0, trailing: 0))
                
                Text("Stopwatch")
                
                Text("Alle oefeningen gedaan?")
                    .padding(EdgeInsets(top: 220, leading: 0, bottom: 0, trailing: 0))
                
                NavigationLink(destination: PlayerSelectionView()) {
                    Text("Beëindig de test")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
            }
            .navigationTitle("KTK3+")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }
    
    func injury() {
        
    }
}

struct KTK3MovingSidewaysView_Previews: PreviewProvider {
    static var previews: some View {
        KTK3MovingSidewaysView()
    }
}
