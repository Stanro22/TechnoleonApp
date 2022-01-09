//
//  PHVTest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/9/22.
//

import Foundation

struct PHVTest: Decodable, Hashable{
    var lenght: Int? = 0
    var sitHeight: Int? = 0
    var weight: Int? = 0
    var id: String? = ""
    var createdAt: String = "" //format to compare
    var modifiedAt: String = "" //format to compare
}
