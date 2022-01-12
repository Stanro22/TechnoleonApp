//
//  GiTStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class GiTStrategy {
    func setTestFields() -> String{
        return "Zones"
    }
    
    func setTestValues(test: GiTTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.zones!))"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Onbekend"
        }
        
        return "\(value)"
    }
}
