//
//  IntervalShuttleRunStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class IntervalShuttleRunStrategy {
    func setTestFields() -> String{
        return NSLocalizedString("LevelISRT", comment: "LevelISRT")
    }
    
    func setTestValues(test: IntervalShuttleRunTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.newLevel!))"
        return value
    }
    
    func processValue(value: Int) -> String{
        if value == 0 {
            return "Injury"
        }
        
        return "\(value)"
    }
}
