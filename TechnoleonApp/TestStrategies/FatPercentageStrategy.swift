//
//  FatPercentageStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class FatPercentageStrategy {
    func setTestFields() -> String{
        return NSLocalizedString("Breast thickness", comment: "Breast thickness") + " \n" +
        NSLocalizedString("Thigh thickness", comment: "Thigh thickness") + " \n" +
        NSLocalizedString("Belly thickness", comment: "Belly thickness") + " \n" +
        NSLocalizedString("Hip thickness", comment: "Hip thickness") + " \n" +
        NSLocalizedString("Armpit thickness", comment: "Armpit thickness") + " \n" +
        NSLocalizedString("Shoulderblade thickness", comment: "Shoulderblade thickness") + " \n" +
        NSLocalizedString("Tricep thickness", comment: "Tricep thickness")
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
