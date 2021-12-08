//
//  TimerManager.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/8/21.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = 15
    var timer = Timer()
    
    func start(){
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                self.timerMode = .initial
                self.secondsLeft = 16
                timer.invalidate()
            }
            self.secondsLeft -= 1
        })
    }
}
