//
//  FatPercentageRequest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/6/22.
//

import Foundation

struct FatPercentageRequest: Encodable{
    let breastThickness: Int?
    let thighThickness: Int?
    let bellyThickness: Int?
    let hipThickness: Int?
    let armPitThickness: Int?
    let shoulderBladeThickness: Int?
    let tricepThickness: Int?
}
