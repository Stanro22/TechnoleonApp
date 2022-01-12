//
//  Sprint10x5MStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class Sprint10x5MStrategy {
    func setTestFields() -> String{
        return "Time"
    }
    
    func setTestValues(test: Sprint10x5Test) -> String{
        var value = ""
        
        value += "\(processValue(value: test.time!))"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Niet gemeten"
        }
        
        return "\(value)"
    }
}
