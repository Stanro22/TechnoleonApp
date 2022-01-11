//
//  OverviewTestItem.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/11/22.
//

import Foundation

struct OverviewTestItem : Hashable {
    var name: String
    var tests: [Test]
    
    init(name: String, tests: [Test]){
        self.name = name
        self.tests = tests
    }
}
