//
//  FatPercentageTest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/9/22.
//

import Foundation

struct FatPercentageTest: Decodable, Hashable{
    var breastThickness: Int? = 0
    var thighThickness: Int? = 0
    var bellyThickness: Int? = 0
    var hipThickness: Int? = 0
    var armPitThickness: Int? = 0
    var shoulderBladeThickness: Int? = 0
    var tricepThickness: Int? = 0
    var id: String? = ""
    var created: String = "" //format to compare
    var modified: String = "" //format to compare
}
