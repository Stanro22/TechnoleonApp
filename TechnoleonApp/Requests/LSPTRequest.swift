//
//  LSPTRequest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/5/22.
//

import Foundation

struct LSPTRequest: Encodable{
    let missedBench: Int? 
    let hitWrongTarget: Int?
    let touchedCone: Int?
    let passOutsideArea: Int?
    let missedTargetArea: Int?
    let hitTenCMStrip: Int?
    let finalTime: String?
}
