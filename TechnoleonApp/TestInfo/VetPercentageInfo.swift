//
//  VetPercentageInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class VetPercentageInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("Fatpercentage_title", comment: "Fatpercentage_title"),
            skills: NSLocalizedString("Fatpercentage_skills", comment: "Fatpercentage_skills"),
            description: NSLocalizedString("Fatpercentage_description", comment: "Fatpercentage_description"),
            itemsNeeded: NSLocalizedString("Fatpercentage_items", comment: "Fatpercentage_items")
        )
    }
}
