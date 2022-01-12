//
//  InsaitJoyRequest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/7/22.
//

import Foundation

struct InsaitJoyRequest: Encodable{
    let level: String?
    let drill: String?
    let trainingTime: String?
    let count: Int?
    let frequency: Int?
    let fluency: Int?
}
