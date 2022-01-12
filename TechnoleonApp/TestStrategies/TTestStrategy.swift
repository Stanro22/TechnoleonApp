//
//  TTestStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class TTestStrategy {
    func setTestFields() -> String{
        return "Tijd"
    }
    
    func setTestValues(test: TTestTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.time!))"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Onbekend"
        }
        
        return "\(value)"
    }
}
