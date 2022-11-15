//
//  FSTStrategy.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class FSTStrategy {
    func setTestFields() -> String{
        return NSLocalizedString("Slalom", comment: "Slalom") + " \n" +
        NSLocalizedString("Backwards", comment: "Backwards") + " \n" +
        NSLocalizedString("Dribble", comment: "Dribble") + " \n" +
        NSLocalizedString("8-figure", comment: "8-figure") + " \n" +
        NSLocalizedString("Pass", comment: "Pass")
    }
    
    func setTestValues(test: FSTTest) -> String{
        var value = ""
        
        value += "\(processValue(value: test.timeSlalom!)) \n"
        value += "\(processValue(value: test.timeBackward!)) \n"
        value += "\(processValue(value: test.timeDribble!)) \n"
        value += "\(processValue(value: test.timeEightFigure!)) \n"
        value += "\(processValue(value: test.timePassing!)) \n"
        return value
    }
    
    func processValue(value: String) -> String{
        if value.isEmpty {
            return "Niet gemeten"
        }
        let time = value.dropFirst(3)
        let finalTime = time.dropLast(4)
        return "\(finalTime)"
    }
}
