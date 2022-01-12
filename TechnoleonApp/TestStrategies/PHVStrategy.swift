//
//  PHVStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class PHVStrategy {
    func setTestFields() -> String{
        return "Zithoogte  \n" +
        "Lengte \n" +
        "Gewicht"
    }
    
    func setTestValues(test: PHVTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.sitHeightCM!)) \n"
        value += "\(processValue(value: test.lengthCM!)) \n"
        value += "\(processValue(value: test.weightKG!))"
        return value
    }
    
    func processValue(value: Int) -> String{
        return "\(value)"
    }
}
