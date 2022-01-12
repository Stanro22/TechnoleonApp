//
//  FSTTest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/9/22.
//

import Foundation

struct FSTTest: Decodable, Hashable{
    var timeSlalom: String? = "00:00:00.00"
    var timeDribble: String? = "00:00:00.00"
    var timeBackward: String? = "00:00:00.00"
    var timePassing: String? = "00:00:00.00"
    var timeEightFigure: String? = "00:00:00.00"
    var goalPostMiss: String? = "GOAL"
    var id: String? = ""
    var created: String = "" //format to compare
    var modified: String = "" //format to compare
}
