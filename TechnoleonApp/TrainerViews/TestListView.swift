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
                if chosenCategorie == NSLocalizedString("Physical", comment: "Physical") {
                    PhysicalTestList()
                }
                if chosenCategorie == NSLocalizedString("Match", comment: "Match") {
                    MatchTestList()
                }
                if chosenCategorie == NSLocalizedString("Technical", comment: "Technical") {
                    TechnicalTestList()
                }
                if chosenCategorie == NSLocalizedString("Cognitive", comment: "Cognitive") {
                    CognitiveTestList()
                }
                if chosenCategorie == NSLocalizedString("Mental", comment: "Mental") {
                    MentalTestList()
                }
                TrainerTabBar(isOverviewActive: false, isTestsActive: false, isProfileActive: false)
            }
            .navigationTitle(chosenCategorie)
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }
