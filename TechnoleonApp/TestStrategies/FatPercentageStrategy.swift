//
//  FatPercentageStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class FatPercentageStrategy {
    func setTestFields() -> String{
        return "Dikte borst \n" +
        "Dikte dij  \n" +
        "Dikte buik \n" +
        "Dikte heup  \n" +
        "Dikte oksel  \n" +
        "Dikte schouderblad \n" +
        "Dikte tricep"
    }
    
    func setTestValues(test: FatPercentageTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.breastThickness!)) \n"
        value += "\(processValue(value: test.thighThickness!)) \n"
        value += "\(processValue(value: test.bellyThickness!)) \n"
        value += "\(processValue(value: test.hipThickness!)) \n"
        value += "\(processValue(value: test.armPitThickness!)) \n"
        value += "\(processValue(value: test.shoulderBladeThickness!)) \n"
        value += "\(processValue(value: test.tricepThickness!))"
        return value
    }
    
    func processValue(value: Int) -> String{
        if value == 0 {
            return "Niet gemeten"
        }
        
        return "\(value)"
    }
}
