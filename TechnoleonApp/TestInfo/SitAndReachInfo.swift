//
//  SitAndReachInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class SitAndReachInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("Sit_and_reach_title", comment: "Sit_and_reach_title"),
            skills: NSLocalizedString("Sit_and_reach_skills", comment: "Sit_and_reach_skills"),
            description: NSLocalizedString("SAR_description", comment: "SAR_description"),
            itemsNeeded: NSLocalizedString("SAR_items", comment: "SAR_items")
        )
    }
}
