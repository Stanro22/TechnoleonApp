//
//  KTK3Info.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class KTK3Info : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("KTK3_title", comment: "KTK3_title"),
            skills: NSLocalizedString("KTK3_skills", comment: "KTK3_skills"),
            description: NSLocalizedString("KTK3_description", comment: "KTK3_description"),
            itemsNeeded: NSLocalizedString("KTK3_items", comment: "KTK3_items")
        )
    }
}
