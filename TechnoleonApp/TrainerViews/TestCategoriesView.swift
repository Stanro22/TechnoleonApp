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
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                
                NavigationLink(destination: TestListView(chosenCategorie: "Fysiek")){
                    Text("Fysiek")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }
                .cornerRadius(20)
                Spacer()
                
                HStack{
                    Spacer()
                    NavigationLink(destination: TestListView(chosenCategorie: "Cognitief")){
                        Text("Cognitief")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                    }
                    .cornerRadius(20)
                    Spacer()
                    NavigationLink(destination: TestListView(chosenCategorie: "Mentaal")){
                        Text("Mentaal")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                    }
                    .cornerRadius(20)
                    Spacer()
                }
                Spacer()
                
                HStack{
                    Spacer()
                    NavigationLink(destination: TestListView(chosenCategorie: "Technisch")){
                        Text("Technisch")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                    }
                    .cornerRadius(20)
                    Spacer()
                    NavigationLink(destination: TestListView(chosenCategorie: "Wedstrijd")){
                        Text("Wedstrijd")
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                    }
                    .cornerRadius(20)
                    Spacer()
                }
                Spacer()
                                
                HStack(alignment: .bottom){
                        NavigationLink(destination: OverviewView()) {
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
                        NavigationLink(destination: PlayerSelectionView()) {
                            VStack{
                                Image(systemName: "globe")
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
                        NavigationLink(destination: ProfileView()) {
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
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }


struct TestCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        TestCategoriesView()
    }
}
