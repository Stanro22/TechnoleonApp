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
        if test.lsptTestId != nil {
            return "LSPT"
        }
        if test.ktK3plusTestId != nil {
            return "KTK3"
        }
        if test.giTTestId != nil {
            return "GiT"
        }
        if test.phvTestId != nil {
            return "PHV"
        }
        if test.sitAndReachTestId != nil {
            return "Sit and Reach"
        }
        if test.fatPercentageTestId != nil {
            return "Fat percentage"
        }
        if test.fstTestId != nil {
            return "FST"
        }
        if test.insaitJoyTestId != nil {
            return "Insait Joy"
        }
        if test.intervalShuttleRunTestId != nil {
            return "Shuttle run"
        }
        if test.yoYoStaminaTestId != nil {
            return "Yo-Yo"
        }
        if test.oneLegStanceTestId != nil {
            return "One Leg Stance"
        }
        if test.tTestTestId != nil {
            return"T-Test"
        }
        if test.tenx5MSprintTestId != nil {
            return "10x5 Sprint"
        }
        if test.tenTwentyThirtyFiveSprintId != nil {
            return "10, 20, 35m Sprint"
        }
        if test.vfmtTestId != nil {
            return "VFMT"
        }
        if test.ijtBallControllTestId != nil {
            return "IJT Ball Controll"
        }
        if test.tvpS3TestId != nil {
            return "TVPS3"
        }
        return "not specified test"
    }
    
    func getChild(test: Test) -> Any?{
        if test.lsptTest != nil {
            return test.lsptTest
        }
        if test.ktk3PlusTest != nil {
            return test.ktk3PlusTest
        }
        if test.giTTest != nil {
            return test.giTTest
        }
        if test.phvTest != nil {
            return test.phvTest
        }
        if test.sitAndReachTest != nil {
            return test.sitAndReachTest
        }
        if test.fatPercentageTest != nil {
            return test.fatPercentageTest
        }
        if test.fstTest != nil {
            return test.fstTest
        }
        if test.insaitJoyTest != nil {
            return test.insaitJoyTest
        }
        if test.intervalShuttleRunTest != nil {
            return test.intervalShuttleRunTest
        }
        if test.yoYoStaminaTest != nil {
            return test.yoYoStaminaTest
        }
        if test.oneLegStanceTest != nil {
            return test.oneLegStanceTest
        }
        if test.tTestTest != nil {
            return test.tTestTest
        }
        if test.tenx5MSprintTest != nil {
            return test.tenx5MSprintTest
        }
        if test.tenTwentyThirtyFiveSprint != nil {
            return test.tenTwentyThirtyFiveSprint
        }
        /*if test.vfmtTestId != nil {
            return vfmtTest
        }
        if test.ijtBallControllTestId != nil {
            return "ijtBallControlTest
        }
        if test.tvpS3TestId != nil {
            return tvps3Test
        }*/
        return nil
    }
}
