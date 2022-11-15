//
//  InsaitJoyInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class InsaitJoyInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("IJBT_title", comment: "IJBT_title"),
            skills: NSLocalizedString("IJBT_skills", comment: "IJBT_skills"),
            description: NSLocalizedString("IJBT_description", comment: "IJBT_description"),
            itemsNeeded: NSLocalizedString("IJBT_items", comment: "IJBT_items")
        )
    }
}
