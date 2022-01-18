//
//  TenTwentyThirtyFiveStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class TenTwentyThirtyFiveStrategy {
    func setTestFields() -> String{
        return "Afstand \n" +
        "Tijd"
    }
    
    func setTestValues(test: TenTwentyThirtyFiveSprintTest) -> String{
        var value = ""
        
        value += "\(processValue(value: String(test.distanceInM!))) \n"
        value += "\(processValueTime(value: test.seconds!))"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Onbekend"
        }
        
        return "\(value)"
    }
    
    func processValueTime(value: String) -> String{
        if value.isEmpty {
            return "Onbekend"
        }
        let time = value.dropFirst(3)
        return "\(time)"
    }
}
