//
//  ShuttleRunInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class ShuttleRunInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("ISRT_title", comment: "ISRT_title"),
            skills: NSLocalizedString("ISRT_skills", comment: "ISRT_skills"),
            description: NSLocalizedString("ISRT_description", comment: "ISRT_description"),
            itemsNeeded: NSLocalizedString("ISRT_items", comment: "ISRT_items")
        )
    }
}
