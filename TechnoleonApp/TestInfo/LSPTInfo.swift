//
//  LSPTInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class LSPTInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("LSPT_title", comment: "LSPT_title"),
            skills: NSLocalizedString("LSPT_skills", comment: "LSPT_skills"),
            description: NSLocalizedString("LSPT_description", comment: "LSPT_description"),
            itemsNeeded: NSLocalizedString("LSPT_items", comment: "LSPT_items")
        )
    }
}
