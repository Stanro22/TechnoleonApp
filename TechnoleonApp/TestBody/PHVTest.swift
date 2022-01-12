//
//  PHVTest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/9/22.
//

import Foundation

struct PHVTest: Decodable, Hashable{
    var lengthCM: Int? = 0
    var sitHeightCM: Int? = 0
    var weightKG: Int? = 0
    var id: String? = ""
    var created: String = "" //format to compare
    var modified: String = "" //format to compare
}
