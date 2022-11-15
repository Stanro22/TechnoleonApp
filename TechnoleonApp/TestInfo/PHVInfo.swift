//
//  PHVInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class PHVInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("APHV_title", comment: "APHV_title"),
            skills: NSLocalizedString("APHV_skills", comment: "APHV_skills"),
            description: NSLocalizedString("APHV_description", comment: "APHV_description"),
            itemsNeeded: NSLocalizedString("APHV_items", comment: "APHV_items")
        )
    }
}
