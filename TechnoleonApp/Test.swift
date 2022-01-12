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
    let lsptTest: LSPTTest?
    let ktK3plusTestId: String?
    let ktk3PlusTest: KTK3Test?
    let giTTestId: String?
    let giTTest: GiTTest?
    let phvTestId: String?
    let phvTest: PHVTest?
    let sitAndReachTestId: String?
    let sitAndReachTest: SitAndReachTest?
    let fatPercentageTestId: String?
    let fatPercentageTest: FatPercentageTest?
    let ijtBallControllTestId: String?
    //let ijtTest: IJTTest?
    let fstTestId: String?
    let fstTest: FSTTest?
    let insaitJoyTestId: String?
    let insaitJoyTest: InsaitJoyTest?
    let intervalShuttleRunTestId: String?
    let intervalShuttleRunTest: IntervalShuttleRunTest?
    let tvpS3TestId: String?
    //let tvpS3Test: TVPS3Test?
    let yoYoStaminaTestId: String?
    let yoYoStaminaTest: YoYoTest?
    let oneLegStanceTestId: String?
    let oneLegStanceTest: OneLegStanceTest?
    let tTestTestId: String?
    let tTestTest: TTestTest?
    let vfmtTestId: String?
    //let vfmtTest: VFMTTest?
    let tenx5MSprintTestId: String?
    let tenx5MSprintTest: Sprint10x5Test?
    let tenTwentyThirtyFiveSprintId: String?
    let tenTwentyThirtyFiveSprint: TenTwentyThirtyFiveSprintTest?
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
