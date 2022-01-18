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
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    @Published var timeToSave = "00:00.00"
    var timer = Timer()
    
    func setTimerLenght(seconds: Int){
        let defaults = UserDefaults.standard
        defaults.set(seconds, forKey: "timerLength")
        secondsLeft = seconds
    }
    
    func start(){
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                self.reset()
            }
            self.secondsLeft -= 1
        })
    }
    
    func reset(){
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timeToSave = "00:00.00"
        timer.invalidate()
    }
    
    func pause(){
        self.timerMode = .paused
        timer.invalidate()
        formatTime()
    }
    
    func formatTime() {
        let minutes : Int32 = Int32(secondsLeft/60)
        let secondsElapsed : Int32 = Int32(secondsLeft) - (minutes * 60)
        let minutesString = (minutes < 10) ? "0\(minutes)" : "\(minutes)"
        let secondsString = (secondsElapsed < 10) ? "0\(secondsElapsed)" : "\(secondsElapsed)"
        timeToSave = minutesString + ":" + secondsString + "." + "000"
    }
}
