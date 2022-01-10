//
//  Test.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import Foundation

struct Test: Decodable, Hashable{
    let playerId: String?
    let category: String?
    let lsptTestId: String?
    let ktk3PlusTestId: String?
    let giTTestId: String?
    let phvTestId: String?
    let sitAndReachTestId: String?
    let fatPercentageTestId: String?
    let fstTestId: String?
    let insaitJoyTestId: String?
    let intervalShuttleRunTestId: String?
    let yoyoTestId: String?
    let oneLegStanceTestId: String?
    let tTestTestId: String?
    let sprint10x5TestId: String?
    let id: String?
    let created: String?
    let modified: String?
    var testName: String?
    
    mutating func setTestName(){
        if lsptTestId != nil {
            testName = "LSPT"
        }
        if ktk3PlusTestId != nil {
            testName = "KTK3"
        }
        if giTTestId != nil {
            testName = "GiT"
        }
        if phvTestId != nil {
            testName = "PHV"
        }
        if sitAndReachTestId != nil {
            testName = "Sit and Reach"
        }
        if fatPercentageTestId != nil {
            testName = "Fat percentage"
        }
        if fstTestId != nil {
            testName = "FST"
        }
        if insaitJoyTestId != nil {
            testName = "Insait Joy"
        }
        if intervalShuttleRunTestId != nil {
            testName = "Shuttle run"
        }
        if yoyoTestId != nil {
            testName = "Yo-Yo"
        }
        if oneLegStanceTestId != nil {
            testName = "One Leg Stance"
        }
        if tTestTestId != nil {
            testName = "T-Test"
        }
        if sprint10x5TestId != nil {
            testName = "10x5 Sprint"
        }
    }
}
