//
//  LSPTStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class LSPTStrategy {
    func setTestFields() -> String{
        return "Bank gemist \n" +
        "Verkeerde target geraakt \n" +
        "Pylon geraakt \n" +
        "Pass buiten gebied \n" +
        "Target area gemist \n" +
        "Strip geraakt"
    }
    
    func setTestValues(test: LSPTTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.missedBench!)) \n"
        value += "\(processValue(value: test.hitWrongTarget!)) \n"
        value += "\(processValue(value: test.touchedCone!)) \n"
        value += "\(processValue(value: test.passOutsideArea!)) \n"
        value += "\(processValue(value: test.missedTargetArea!)) \n"
        value += "\(processValue(value: test.hitTenCMStrip!))"
        //value += "\(processValue(value: test.finalTime!))"
        return value
    }
    
    func processValue(value: Int) -> String{
        return "\(value)"
    }
}
