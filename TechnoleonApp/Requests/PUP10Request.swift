//
//  PUP10Request.swift
//  TechnoleonApp
//
//  Created by user220873 on 2/3/23.
//

import Foundation

struct PUP10Request: Encodable{
    let final_time: String?
    let wrong_target: Int?
    let taken_away: Int?
    let outside_cones: Int?
    let to_high_outside_cones: Int?
    let over_the_line_outside_cones: Int?
    let wrong_area_outside_cones: Int?
    let to_high_inside_cones: Int?
    let over_the_line_inside_cones: Int?
    let wrong_area_inside_cones: Int?
}
