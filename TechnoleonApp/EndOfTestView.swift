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
            Text("Einde test")
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
