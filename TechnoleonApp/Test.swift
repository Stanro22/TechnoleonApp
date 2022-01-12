//
//  Test.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import Foundation

struct Test: Decodable, Hashable{
    var playerId: String?
    var category: String?
    var lsptTestId: String?
    var lsptTest: LSPTTest?
    var ktK3plusTestId: String?
    var ktK3plusTest: KTK3Test?
    var giTTestId: String?
    var giTTest: GiTTest?
    var phvTestId: String?
    var phvTest: PHVTest?
    var sitAndReachTestId: String?
    var sitAndReachTest: SitAndReachTest?
    var fatPercentageTestId: String?
    var fatPercentageTest: FatPercentageTest?
    var ijtBallControllTestId: String?
    //var ijtTest: IJTTest?
    var fstTestId: String?
    var fstTest: FSTTest?
    var insaitJoyTestId: String?
    var insaitJoyTest: InsaitJoyTest?
    var intervalShuttleRunTestId: String?
    var intervalShuttleRunTest: IntervalShuttleRunTest?
    var tvpS3TestId: String?
    //var tvpS3Test: TVPS3Test?
    var yoYoStaminaTestId: String?
    var yoYoStaminaTest: YoYoTest?
    var oneLegStanceTestId: String?
    var oneLegStanceTest: OneLegStanceTest?
    var tTestTestId: String?
    var tTestTest: TTestTest?
    var vfmtTestId: String?
    //var vfmtTest: VFMTTest?
    var tenx5MSprintTestId: String?
    var tenx5MSprintTest: Sprint10x5Test?
    var tenTwentyThirtyFiveSprintId: String?
    var tenTwentyThirtyFiveSprint: TenTwentyThirtyFiveSprintTest?
    var id: String?
    var created: String?
    var modified: String?
    
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
        if test.ktK3plusTest != nil {
            return test.ktK3plusTest
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
