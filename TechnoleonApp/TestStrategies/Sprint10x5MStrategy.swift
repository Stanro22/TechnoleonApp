//
//  Sprint10x5MStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class Sprint10x5MStrategy {
    func setTestFields() -> String{
        return NSLocalizedString("Time", comment: "Time")
    }
    
    func setTestValues(test: Sprint10x5Test) -> String{
        var value = ""
        
        value += "\(processValue(value: test.seconds!))"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Niet gemeten"
        }
        let time = value.dropFirst(3)
        let finalTime = time.dropLast(4)
        return "\(finalTime)"
    }
}
