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
            Text("Testen")
            .navigationTitle("Categorieën" )
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }
}

struct TestCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        TestCategoriesView()
    }
}
