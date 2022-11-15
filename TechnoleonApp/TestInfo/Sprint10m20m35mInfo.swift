//
//  Sprint10m20m35mInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class Sprint10m20m35mInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("Sprint3_title", comment: "Sprint3_title"),
            skills: NSLocalizedString("Sprint3_skills", comment: "Sprint3_skills"),
            description: NSLocalizedString("Sprint3_description", comment: "Sprint3_description"),
            itemsNeeded: NSLocalizedString("Sprint3_items", comment: "Sprint3_items")
        )
    }
}
