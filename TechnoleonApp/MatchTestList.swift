//
//  MatchTestListView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import SwiftUI

struct MatchTestList: View {
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                Text("Geen vragenlijsten voor wedstrijd beschikbaar")
                    .font(.custom("", size: 20))
                Spacer()
            }
        }
    }
}

struct MatchTestList_Previews: PreviewProvider {
    static var previews: some View {
        MatchTestList()
    }
}
