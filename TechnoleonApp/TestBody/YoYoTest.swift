//
//  YoYoTest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/9/22.
//

import Foundation

struct YoYoTest: Decodable, Hashable{
    var newLevel: Int? = 0
    var id: String? = ""
    var createdAt: String = "" //format to compare
    var modifiedAt: String = "" //format to compare
}
