//
//  SitAndReachStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class SitAndReachStrategy {
    func setTestFields() -> String{
        return "Centimeter"
    }
    
    func setTestValues(test: SitAndReachTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.centimeters!))"
        return value
    }
    
    func processValue(value: Int) -> String{
        return "\(value)"
    }
}
