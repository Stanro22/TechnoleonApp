//
//  Sprint10x5Info.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class Sprint10x5Info : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("Sprint10x5_title", comment: "Sprint10x5_title"),
            skills: NSLocalizedString("Sprint10x5_skills", comment: "Sprint10x5_skills"),
            description: NSLocalizedString("Sprint10x5_description", comment: "Sprint10x5_description"),
            itemsNeeded: NSLocalizedString("Sprint10x5_items", comment: "Sprint10x5_items")
        )
    }
}
