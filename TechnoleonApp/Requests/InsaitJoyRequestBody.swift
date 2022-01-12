//
//  InsaitJoyRequestBody.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/7/22.
//

import Foundation

final class InsaitJoyRequestBody : ObservableObject {
    static let shared = InsaitJoyRequestBody()
    
    var level: String? = "BEGINNER"
    var drill: String? = "JUGGLE"
    var trainingTime: String? = "THRITY_SECONDS"
    var count: Int? = 0
    var frequency: Int? = 0
    var fluency: Int? = 0
}
