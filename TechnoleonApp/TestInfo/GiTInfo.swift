//
//  GiTInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class GiTInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("GiD_title", comment: "GiD_title"),
            skills: NSLocalizedString("GiD_skills", comment: "GiD_skills"),
            description: NSLocalizedString("GiD_description", comment: "GiD_description"),
            itemsNeeded: NSLocalizedString("GiD_items", comment: "GiD_items")
        )
    }
}
