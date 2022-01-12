//
//  OverviewTestItem.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/11/22.
//

import Foundation

struct OverviewTestItem : Hashable {
    var name: String
    var players: [Player]
    var tests: [Test]
    
    init(name: String, players: [Player], tests: [Test]){
        self.name = name
        self.players = players
        self.tests = tests
    }
}
