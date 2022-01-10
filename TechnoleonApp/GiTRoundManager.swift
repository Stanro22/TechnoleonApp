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
    
    func setRounds(){
        for number in 1...10 {
            let gitRound: GiTRound = GiTRound()
            gitRound.id = number
            rounds![number] = gitRound
        }
    }
}
