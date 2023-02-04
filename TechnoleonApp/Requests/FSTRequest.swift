//
//  FSTRequest.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/6/22.
//

import Foundation

struct FSTRequest: Encodable{
    let slalomTime: String?
    let dribbleTime: String?
    let backwardTime: String?
    let eightFigureTime: String?
    let passingTime: String?
    let goalPostMiss: String?
}
