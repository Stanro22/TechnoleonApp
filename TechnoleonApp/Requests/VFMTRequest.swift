//
//  VFMTRequest.swift
//  TechnoleonApp
//
//  Created by user220873 on 11/18/22.
//

import Foundation

struct VFMTRequest: Encodable{
    let trail1_end_time: String?
    let trail1_errors: Int?
    let trail2_end_time: String?
    let trail2_errors: Int?
    let trail3_end_time: String?
    let trail3_errors: Int?
}
