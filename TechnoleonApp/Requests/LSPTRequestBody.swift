//
//  LSPTRequestBody.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/5/22.
//

import Foundation

final class LSPTRequestBody : ObservableObject {
    var missedBench: Int? = 0
    var hitWrongTarget: Int? = 0
    var touchedCone: Int? = 0
    var passOutsideArea: Int? = 0
    var missedTargetArea: Int? = 0
    var hitTenCMStrip: Int? = 0
    var finalTime: String? = "00:00:00.00"
}
