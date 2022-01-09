//
//  LSPTTest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/9/22.
//

import Foundation

struct LSPTTest: Decodable, Hashable{
    var missedBench: Int? = 0
    var hitWrongTarget: Int? = 0
    var touchedCone: Int? = 0
    var passOutsideArea: Int? = 0
    var missedTargetArea: Int? = 0
    var hitTenCMStrip: Int? = 0
    var time: String? = "00:00:00.00"
    var finalTime: String? = "00:00:00.00"
    var secondsOver: String? = "00:00:00.00"
    var id: String? = ""
    var createdAt: String = "" //format to compare
    var modifiedAt: String = "" //format to compare
}
