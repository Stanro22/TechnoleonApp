//
//  LSPTStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class LSPTStrategy {
    func setTestFields() -> String{
        return NSLocalizedString("Missed bench", comment: "Missed bench") + " \n" +
        NSLocalizedString("Hit wrong target", comment: "Hit wrong target") + " \n" +
        NSLocalizedString("Touched cone", comment: "Touched cone") + " \n" +
        NSLocalizedString("Pass outside area", comment: "Pass outside area") + " \n" +
        NSLocalizedString("Missed target area", comment: "Missed target area") + " \n" +
        NSLocalizedString("Hit strip", comment: "Hit strip")
    }
    
    func setTestValues(test: LSPTTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.missedBench!)) \n"
        value += "\(processValue(value: test.hitWrongTarget!)) \n"
        value += "\(processValue(value: test.touchedCone!)) \n"
        value += "\(processValue(value: test.passOutsideArea!)) \n"
        value += "\(processValue(value: test.missedTargetArea!)) \n"
        value += "\(processValue(value: test.hitTenCMStrip!))"
        return value
    }
    
    func processValue(value: Int) -> String{
        return "\(value)"
    }
}
