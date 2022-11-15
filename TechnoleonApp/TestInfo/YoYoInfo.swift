//
//  YoYoInfo.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation

class YoYoInfo : TestInfo {
    init() {
        super.init(
            name: NSLocalizedString("YYIRT_title", comment: "YYIRT_title"),
            skills: NSLocalizedString("YYIRT_skills", comment: "YYIRT_skills"),
            description: NSLocalizedString("YYIRT_description", comment: "YYIRT_description"),
            itemsNeeded: NSLocalizedString("YYIRT_items", comment: "YYIRT_items")
        )
    }
}
