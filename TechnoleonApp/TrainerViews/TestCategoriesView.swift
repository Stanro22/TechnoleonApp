//
//  TestCategoriesView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/22/21.
//

import SwiftUI

struct TestCategoriesView: View {
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
                    }
                    .frame(width: 130, height: 130)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                    Spacer()
                }
                Spacer()
                                
                TrainerTabBar(isOverviewActive: false, isTestsActive: true, isProfileActive: false)
            }
            .navigationTitle("Categorieën")
            .navigationBarBackButtonHidden(true)
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
}

struct TestCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        TestCategoriesView()
    }
}
