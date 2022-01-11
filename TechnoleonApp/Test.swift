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
    let ktK3plusTestId: String?
    let giTTestId: String?
    let phvTestId: String?
    let sitAndReachTestId: String?
    let fatPercentageTestId: String?
    let ijtBallControllTestId: String?
    let fstTestId: String?
    let insaitJoyTestId: String?
    let intervalShuttleRunTestId: String?
    let tvpS3TestId: String?
    let yoYoStaminaTestId: String?
    let oneLegStanceTestId: String?
    let tTestTestId: String?
    let vfmtTestId: String?
    let tenx5MSprintTestId: String?
    let tenTwentyThirtyFiveSprintId: String?
    let id: String?
    let created: String?
    let modified: String?
    
    func getTestName(test: Test) -> String {
        if lsptTestId != nil {
            return "LSPT"
        }
        if ktK3plusTestId != nil {
            return "KTK3"
        }
        if giTTestId != nil {
            return "GiT"
        }
        if phvTestId != nil {
            return "PHV"
        }
        if sitAndReachTestId != nil {
            return "Sit and Reach"
        }
        if fatPercentageTestId != nil {
            return "Fat percentage"
        }
        if fstTestId != nil {
            return "FST"
        }
        if insaitJoyTestId != nil {
            return "Insait Joy"
        }
        if intervalShuttleRunTestId != nil {
            return "Shuttle run"
        }
        if yoYoStaminaTestId != nil {
            return "Yo-Yo"
        }
        if oneLegStanceTestId != nil {
            return "One Leg Stance"
        }
        if tTestTestId != nil {
            return"T-Test"
        }
        if tenx5MSprintTestId != nil {
            return "10x5 Sprint"
        }
        if tenTwentyThirtyFiveSprintId != nil {
            return "10, 20, 35m Sprint"
        }
        if vfmtTestId != nil {
            return "VFMT"
        }
        if ijtBallControllTestId != nil {
            return "IJT Ball Controll"
        }
        if tvpS3TestId != nil {
            return "TVPS3"
        }
        return "not specified test"
    }
}
