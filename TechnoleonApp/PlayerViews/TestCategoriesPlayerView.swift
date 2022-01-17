//
//  TestCategoriesPlayerView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/17/22.
//

import SwiftUI

struct TestCategoriesPlayerView: View {
    var body: some View {
            VStack{
                Spacer()
                Text("Kies een testcategorie")
                    .font(.custom("", size: 24))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                
                VStack{
                    Text("Fysiek")
                        .foregroundColor(Color.black)
                    NavigationLink(destination: TestListView(chosenCategorie: "Fysiek")){
                        Image("heart")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 70, height: 70)
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                    .cornerRadius(90)
                    .disabled(true)
                }
                .frame(width: 130, height: 130)
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Cognitief")
                            .foregroundColor(Color.black)
                        NavigationLink(destination: TestListView(chosenCategorie: "Cognitief")){
                            Image("eye")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 40, height: 30)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                        .cornerRadius(90)
                        .disabled(true)
                    }
                    .frame(width: 130, height: 130)
                    Spacer()
                    VStack{
                        Text("Mentaal")
                            .foregroundColor(Color.black)
                        NavigationLink(destination: TestListView(chosenCategorie: "Mentaal")){
                            Image("mental")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                        .cornerRadius(90)
                        .disabled(true)
                    }
                    .frame(width: 130, height: 130)
                    Spacer()
                }
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Technisch")
                            .foregroundColor(Color.black)
                        NavigationLink(destination: TestListView(chosenCategorie: "Technisch")){
                            Image("ball")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                        .cornerRadius(90)
                        .disabled(true)
                    }
                    .frame(width: 130, height: 130)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                    Spacer()
                    VStack{
                        Text("Wedstrijd")
                            .foregroundColor(Color.black)
                        NavigationLink(destination: TestListView(chosenCategorie: "Wedstrijd")){
                            Image("match")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                        .cornerRadius(90)
                        .disabled(true)
                    }
                    .frame(width: 130, height: 130)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                    Spacer()
                }
                Spacer()
                                
                HStack(alignment: .bottom){
                        NavigationLink(destination: OverviewPlayerView()) {
                            VStack{
                                Image(systemName: "binoculars.fill")
                                    .foregroundColor(Color.white)
                                Text("Overzicht")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                        NavigationLink(destination: TestCategoriesPlayerView()) {
                            VStack{
                                Image("ball")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.white)
                                Text("Testen")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.18, green: 0.25, blue: 0.44))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: -10))
                        NavigationLink(destination: ProfilePlayerView()) {
                            VStack{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(Color.white)
                                Text("Profiel")
                                    .foregroundColor(Color.white)
                                    .font(.custom("", size: 14))
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                }
            }
            .navigationTitle("Categorieën")
            .navigationBarBackButtonHidden(true)
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }


struct TestCategoriesPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TestCategoriesPlayerView()
    }
}
