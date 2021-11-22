//
//  OverviewView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/22/21.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        NavigationView{
            Text("Overzicht")
            .navigationTitle("Overzicht")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
