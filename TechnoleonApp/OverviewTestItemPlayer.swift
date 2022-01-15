//
//  OverviewTestItemPlayer.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/15/22.
//

import Foundation

struct OverviewTestItemPlayer : Hashable {
    var name: String
    var test: Test
    
    init(name: String, test: Test){
        self.name = name
        self.test = test
    }
}
