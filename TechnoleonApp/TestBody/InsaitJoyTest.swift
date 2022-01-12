//
//  InsaitJoyTest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/9/22.
//

import Foundation

struct InsaitJoyTest: Decodable, Hashable{
    var level: String? = "BEGINNER"
    var drill: String? = "JUGGLE"
    var time: String? = "THRITY_SECONDS"
    var count: Int? = 0
    var frequency: Int? = 0
    var fluency: Int? = 0
    var id: String? = ""
    var created: String = "" //format to compare
    var modified: String = "" //format to compare
}
