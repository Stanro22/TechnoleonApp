//
//  T-TestInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class T_TestInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("T-Test_title", comment: "T-Test_title"),
            skills: NSLocalizedString("T-Test_skills", comment: "T-Test_skills"),
            description: NSLocalizedString("T-Test_description", comment: "T-Test_description"),
            itemsNeeded: NSLocalizedString("T-Test_items", comment: "T-Test_items")
        )
    }
}
