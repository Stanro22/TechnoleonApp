//
//  TestInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class TestInfo {
    var name: String?
    var skills: String?
    var description: String?
    var itemsNeeded: String?
    
    init(name: String, skills: String, description: String, itemsNeeded: String){
        self.name = name
        self.skills = skills
        self.description = description
        self.itemsNeeded = itemsNeeded
    }
}
