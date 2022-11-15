//
//  FSTInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class FSTInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("FST_title", comment: "FST_title"),
            skills: NSLocalizedString("FST_skills", comment: "FST_skills"),
            description: NSLocalizedString("FST_description", comment: "FST_description"),
            itemsNeeded: NSLocalizedString("FST_items", comment: "FST_items")
        )
    }
}
