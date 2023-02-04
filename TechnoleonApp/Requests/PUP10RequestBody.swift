//
//  PUP10RequestBody.swift
//  TechnoleonApp
//
//  Created by user220873 on 2/3/23.
//

import Foundation

final class PUP10RequestBody : ObservableObject {
    var final_time: String? = ""
    var wrong_target: Int? = 0
    var taken_away: Int? = 0
    var outside_cones: Int? = 0
    var to_high_outside_cones: Int? = 0
    var over_the_line_outside_cones: Int? = 0
    var wrong_area_outside_cones: Int? = 0
    var to_high_inside_cones: Int? = 0
    var over_the_line_inside_cones: Int? = 0
    var wrong_area_inside_cones: Int? = 0
}
