//
//  VFMTRequestBody.swift
//  TechnoleonApp
//
//  Created by user220873 on 11/18/22.
//

import Foundation

final class VFMTRequestBody : ObservableObject {
    static let shared = VFMTRequestBody()
    
    var trial1_end_time: String? = "00:00:00.00"
    var trail1_errors: Int? = 0
    var trial2_end_time: String? = "00:00:00.00"
    var trail2_errors: Int? = 0
    var trial3_end_time: String? = "00:00:00.00"
    var trail3_errors: Int? = 0
}
