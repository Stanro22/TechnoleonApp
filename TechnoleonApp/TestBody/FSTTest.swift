//
//  FSTTest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/9/22.
//

import Foundation

struct FSTTest: Decodable, Hashable{
    var slalomTime: String? = "00:00:00.00"
    var dribbletime: String? = "00:00:00.00"
    var backwardTime: String? = "00:00:00.00"
    var passingTime: String? = "00:00:00.00"
    var figureTime: String? = "00:00:00.00"
    var goalPostMiss: String? = "GOAL"
    var id: String? = ""
    var createdAt: String = "" //format to compare
    var modifiedAt: String = "" //format to compare
}
