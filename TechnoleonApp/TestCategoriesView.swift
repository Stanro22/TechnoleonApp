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
                    .padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
                Image("categorieen")
                    .resizable()
                    .padding()
                    .frame(width: 400, height: 430)
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
