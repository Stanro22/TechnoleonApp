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
            name: "Interval shuttle run",
            skills: "Uithoudingsvermogen",
            description: "De shuttle run test meet het uithoudingsvermogen van de spelers. De spelers moeten telkens voor de piep over de lijn zijn. Mocht dit niet het geval zijn kan een gele en opeenvolgend rode kaart toegekent worden waarna de speler moet stoppen met de test. Deze test voer je uit voor het gehele team.",
            itemsNeeded: "Voor deze test is nodig: de opname met piepjes."
        )
    }
}
