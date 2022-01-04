//
//  OneLegStanceRequestBody.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/4/22.
//

import Foundation

final class OneLegStanceRequestBody : ObservableObject {
    static let shared = OneLegStanceRequestBody()
    var secondsLeft: String? = "00:00:00.00"
    var seconds: String? = "00:00:00.00"
}
