//
//  RPERequest.swift
//  TechnoleonApp
//
//  Created by user220873 on 2/3/23.
//

import Foundation

struct RPERequest: Encodable{
    let trainingstype: String?
    let sessiontype: String?
    let date_of_training: String?
    let starting_time: String?
    let duration: String?
    let days_before_or_after_training: String?
    let rpe_score: Int?
    let satisfaction: String?
    let comments: String?
}
