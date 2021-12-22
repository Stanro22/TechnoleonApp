//
//  StopwatchManager.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import Foundation
import SwiftUI

class StopwatchManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    @Published var seconds = 0
    var timer = Timer()
    
    func start(){
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.seconds += 1
        })
    }
    
    func reset(){
        self.timerMode = .initial
        self.seconds = 0
        timer.invalidate()
    }
    
    func pause(){
        self.timerMode = .paused
        timer.invalidate()
    }
}
