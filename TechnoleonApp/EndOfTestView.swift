//
//  EndOfTestView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/25/21.
//

import SwiftUI

struct EndOfTestView: View {
    var body: some View {
        VStack{
            Text("Gegevens zijn opgeslagen")
            
            NavigationLink(destination: TestCategoriesView()) {
                Text("Kies andere test")
                    .padding()
                    .foregroundColor(Color.white)
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(10)
            Text("Of")
            
            NavigationLink(destination: TeamSelectionView()) {
                Text("Wissel team")
                    .padding()
                    .foregroundColor(Color.white)
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(10)
        }
        .navigationTitle("Einde test")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct EndOfTestView_Previews: PreviewProvider {
    static var previews: some View {
        EndOfTestView()
    }
}
