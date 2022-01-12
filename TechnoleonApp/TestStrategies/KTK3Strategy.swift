//
//  KTK3Strategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class KTK3Strategy {
    func setTestFields() -> String{
        return "Zijwaarts springen \n" +
        "Zijwaarts bewegen \n" +
        "Balk 1 \n" +
        "Balk 2 \n" +
        "Balk 3 \n" +
        "Hand oog"
    }
    
    func setTestValues(test: KTK3Test) -> String{
        var values = ""
        
        let jumpFirstAttempt = test.hoppingSideways1!
        let jumpSecondAttempt = test.hoppingSideWays2!
        let hoppingSideways = processValueTwoAttempts(first: jumpFirstAttempt, second: jumpSecondAttempt)
        values += "\(hoppingSideways) \n"
        
        let moveFirstAttempt = test.movingSideways1!
        let moveSecondAttempt = test.movingSideways2!
        let movingSideways = processValueTwoAttempts(first: moveFirstAttempt, second: moveSecondAttempt)
        values += "\(movingSideways) \n"
        
        let beamOneFirstAttempt = test.beam11!
        let beamOneSecondAttempt = test.beam12!
        let beamOneThirdAttempt = test.beam13!
        let beamOne = processValueThreeAttempts(first: beamOneFirstAttempt, second: beamOneSecondAttempt, third: beamOneThirdAttempt)
        values += "\(beamOne) \n"
        
        let beamTwoFirstAttempt = test.beam21!
        let beamTwoSecondAttempt = test.beam22!
        let beamTwoThirdAttempt = test.beam23!
        let beamTwo = processValueThreeAttempts(first: beamTwoFirstAttempt, second: beamTwoSecondAttempt, third: beamTwoThirdAttempt)
        values += "\(beamTwo) \n"
        
        let beamThreeFirstAttempt = test.beam31!
        let beamThreeSecondAttempt = test.beam32!
        let beamThreeThirdAttempt = test.beam33!
        let beamThree = processValueThreeAttempts(first: beamThreeFirstAttempt, second: beamThreeSecondAttempt, third: beamThreeThirdAttempt)
        values += "\(beamThree) \n"
        
        let handEyeFirstAttempt = test.handEye1!
        let handEyeSecondAttempt = test.handEye2!
        let handEye = processValueTwoAttempts(first: handEyeFirstAttempt, second: handEyeSecondAttempt)
        values += "\(handEye)"
        
        return values
    }
    
    func processValueTwoAttempts(first: Int, second: Int) -> String {
        if first == 0 && second == 0{
            return "Injury"
        }
        let score = first + second
        return "\(score)"
    }
    
    func processValueThreeAttempts(first: Int, second: Int, third: Int) -> String {
        if first == 0 && second == 0 && third == 0{
            return "Injury"
        }
        let score = first + second + third
        return "\(score)"
    }
}
