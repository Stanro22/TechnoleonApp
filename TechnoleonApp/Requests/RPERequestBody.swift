//
//  RPERequestBody.swift
//  TechnoleonApp
//
//  Created by user220873 on 2/3/23.
//

import Foundation

final class RPERequestBody : ObservableObject {
    var trainingstype: String? = ""
    var sessiontype: String? = ""
    var date_of_training: String? = ""
    var starting_time: String? = ""
    var duration: String? = ""
    var days_before_or_after_training: String? = ""
    var rpe_score: Int? = 0
    var satisfaction: String? = ""
    var comments: String? = ""
}
