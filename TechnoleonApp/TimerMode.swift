//
//  TimerMode.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/8/21.
//

import Foundation

enum TimerMode{
    case running
    case paused
    case initial
}

func secondsToMinutesAndSeconds(seconds: Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "" + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    return "\(minuteStamp):\(secondStamp)"
}
