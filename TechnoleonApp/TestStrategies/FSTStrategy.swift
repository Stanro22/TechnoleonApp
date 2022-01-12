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
        
        return "\(value)"
    }
}
