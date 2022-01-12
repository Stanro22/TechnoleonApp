//
//  InsaitJoyStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class InsaitJoyStrategy {
    func setTestFields() -> String{
        return "Level \n" +
        "Oefening \n" +
        "Tijd \n" +
        "Aantal \n" +
        "Frequentie \n" +
        "Vloeibaarheid"
    }
    
    func setTestValues(test: InsaitJoyTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.level!)) \n"
        value += "\(processValue(value: test.drill!)) \n"
        value += "\(processValue(value: test.trainingTime!)) \n"
        value += "\(processValue(value: String(test.count!))) \n"
        value += "\(processValue(value: String(test.frequency!))) \n"
        value += "\(processValue(value: String(test.fluency!)))"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Niet gemeten"
        }
        
        return "\(value)"
    }
}
