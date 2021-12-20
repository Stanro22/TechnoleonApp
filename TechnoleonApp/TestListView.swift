//
//  PhysicalTestView.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/24/21.
//

import SwiftUI

struct TestListView: View {
    let chosenCategorie: String
    
    var body: some View {
            VStack{
                if chosenCategorie == "Fysiek" {
                    PhysicalTestList()
                }
                if chosenCategorie == "Wedstrijd" {
                    MatchTestList()
                }
                if chosenCategorie == "Technisch" {
                    TechnicalTestList()
                }
                if chosenCategorie == "Cognitief" {
                    CognitiveTestList()
                }
                if chosenCategorie == "Mentaal" {
                    MentalTestList()
                }
                Spacer()
            }
            .navigationTitle(chosenCategorie)
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }
