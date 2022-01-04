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
    @Published var seconds = 0.0
    @Published var timeToSave = "00:00.00"
    var timer = Timer()
    
    func start(){
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { timer in
            self.seconds += 0.001
        })
    }
    
    func reset(){
        self.timerMode = .initial
        self.seconds = 0
        timeToSave = "00:00.00"
        timer.invalidate()
    }
    
    func pause(){
        self.timerMode = .paused
        timer.invalidate()
        formatTime()
    }
    
    func formatTime() {
        let minutes : Int32 = Int32(seconds/60)
        let secondsElapsed : Int32 = Int32(seconds) - (minutes * 60)
        let milliseconds: Int32 = Int32(seconds.truncatingRemainder(dividingBy: 1) * 100)
        let minutesString = (minutes < 10) ? "0\(minutes)" : "\(minutes)"
        let secondsString = (secondsElapsed < 10) ? "0\(secondsElapsed)" : "\(secondsElapsed)"
        let millisecondsString = (milliseconds < 10) ? "0\(milliseconds)" : "\(milliseconds)"
        timeToSave = minutesString + ":" + secondsString + "." + millisecondsString
    }
}
