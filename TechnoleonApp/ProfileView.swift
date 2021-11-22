//
//  ProfileView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/22/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            Text("Profiel")
            .navigationTitle("Profiel")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
