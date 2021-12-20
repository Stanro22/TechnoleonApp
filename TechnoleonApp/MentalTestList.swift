//
//  MentalTestList.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import SwiftUI

struct MentalTestList: View {
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                Text("Geen mentale testen of vragenlijsten beschikbaar")
                    .font(.custom("", size: 20))
                Spacer()
            }
        }
    }
}

struct MentalTestList_Previews: PreviewProvider {
    static var previews: some View {
        MentalTestList()
    }
}
