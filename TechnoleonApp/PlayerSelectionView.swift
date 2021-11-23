//
//  PlayerSelectionView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/23/21.
//

import SwiftUI

struct PlayerSelectionView: View {
    @State var expand = false
    
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    .padding()
                Text("Selecteer een speler")
                VStack() {
                    HStack(spacing: 200) {
                        Text("Speler")
                            .foregroundColor(Color.gray)
                        Image(systemName: expand ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 13, height: 6, alignment: .trailing)
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                    }.onTapGesture {
                        self.expand.toggle()
                    }
                    if expand {
                        //menu items here
                    }
                }
                .padding()
                .background(Color(red: 0.93, green: 0.93, blue: 0.93))
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                Button(action: ChooseCategorie) {
                    Text("Kies categorie")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 200, leading: 0, bottom: 0, trailing: 0))
            }
            .navigationTitle("Speler selectie" )
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }
}

func ChooseCategorie(){
    
}

struct PlayerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSelectionView()
    }
}
