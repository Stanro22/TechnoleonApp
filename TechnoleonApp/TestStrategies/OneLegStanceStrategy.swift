//
//  OneLegStanceStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class OneLegStanceStrategy {
    func setTestFields() -> String{
        return "Linkerbeen \n" +
        "Rechterbeen"
    }
    
    func setTestValues(test: OneLegStanceTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.secondsLeft!)) \n"
        value += "\(processValue(value: test.seconds!))"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Onbekend"
        }
        
        return "\(value)"
    }
}
