//
//  TestListCell.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/24/21.
//

import SwiftUI

struct TestListCell: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("KTK3+")
                    .foregroundColor(Color.black)
                Text("Coördinatie, balans")
                    .font(.custom("", size: 14))
                    .foregroundColor(Color.gray)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 170))
            Image(systemName: "info.circle.fill")
                .resizable()
                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                .frame(width: 25, height: 25)
        }
        .frame(width: 350, height: 50, alignment: .leading)
    }
}

struct TestListCell_Previews: PreviewProvider {
    static var previews: some View {
        TestListCell()
    }
}
