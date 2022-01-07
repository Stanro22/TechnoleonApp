//
//  GiTRoundManager.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/7/22.
//

import Foundation

class GiTRoundManager : ObservableObject{
    static let shared = GiTRoundManager()
    var rounds: [GiTRound]?
}
