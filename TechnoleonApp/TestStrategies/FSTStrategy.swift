//
//  FSTStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class FSTStrategy {
    func setTestFields() -> String{
        return "Slalom \n" +
        "Achterwaards  \n" +
        "Dribbel \n" +
        "8-Figuur \n" +
        "Passen"
    }
    
    func setTestValues(test: FSTTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.slalomTime!)) \n"
        value += "\(processValue(value: test.backwardTime!)) \n"
        value += "\(processValue(value: test.dribbletime!)) \n"
        value += "\(processValue(value: test.figureTime!)) \n"
        value += "\(processValue(value: test.passingTime!)) \n"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Niet gemeten"
        }
        
        return "\(value)"
    }
}
