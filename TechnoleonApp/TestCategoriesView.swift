//
//  TestCategoriesView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/22/21.
//

import SwiftUI

struct TestCategoriesView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Kies een testcategorie")
                    .font(.custom("", size: 24))
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                Image("categorieen")
                    .resizable()
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                    .frame(width: 350, height: 400)
                
                HStack(alignment: .bottom){
                        NavigationLink(destination: PlayerSelectionView()) {
                            VStack{
                                Image(systemName: "binoculars.fill")
                                    .foregroundColor(Color.white)
                                Text("Overzicht")
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: -10))
                        NavigationLink(destination: PlayerSelectionView()) {
                            VStack{
                                Image(systemName: "globe")
                                    .foregroundColor(Color.white)
                                Text("Testen")
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 1.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -10))
                        NavigationLink(destination: PlayerSelectionView()) {
                            VStack{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(Color.white)
                                Text("Profiel")
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 100, height: 20)
                            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
                            .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .navigationTitle("Categorieën")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }
}

struct TestCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        TestCategoriesView()
    }
}
