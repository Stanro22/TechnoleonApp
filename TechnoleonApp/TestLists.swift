//
//  TestLists.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/11/22.
//

import Foundation

class TestList : ObservableObject {
    static let shared = TestList()
    
    @Published var testListKTK3: [Test]?
    @Published var testListLSPT: [Test]?
    @Published var testListGIT: [Test]?
    @Published var testListPHV: [Test]?
    @Published var testListsitAndReach: [Test]?
    @Published var testListfatPercentage: [Test]?
    @Published var testListIJT: [Test]?
    @Published var testListFST: [Test]?
    @Published var testListInsaitJoy: [Test]?
    @Published var testListShuttleRun: [Test]?
    @Published var testListOneLegStance: [Test]?
    @Published var testListTVPS3: [Test]?
    @Published var testListTTest: [Test]?
    @Published var testListVFMT: [Test]?
    @Published var testList10x5Sprint: [Test]?
    @Published var testListYoYo: [Test]?
    @Published var testListTenTwentyThirtyFiveSprint: [Test]?
    
    func addToList(test: Test){
        if test.lsptTestId != nil {
            TestList.shared.testListLSPT?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListLSPT!.endIndex)
        }
        if test.ktK3plusTestId != nil {
            TestList.shared.testListKTK3?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListKTK3!.endIndex)
        }
        if test.giTTestId != nil {
            TestList.shared.testListGIT?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListGIT!.endIndex)
        }
        if test.phvTestId != nil {
            TestList.shared.testListPHV?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListPHV!.endIndex)
        }
        if test.sitAndReachTestId != nil {
            TestList.shared.testListsitAndReach?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListsitAndReach!.endIndex)
        }
        if test.fatPercentageTestId != nil {
            TestList.shared.testListfatPercentage?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListfatPercentage!.endIndex)
        }
        if test.fstTestId != nil {
            TestList.shared.testListFST?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListFST!.endIndex)
        }
        if test.insaitJoyTestId != nil {
            TestList.shared.testListInsaitJoy?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListInsaitJoy!.endIndex)
        }
        if test.intervalShuttleRunTestId != nil {
            TestList.shared.testListShuttleRun?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListShuttleRun!.endIndex)
        }
        if test.yoYoStaminaTestId != nil {
            TestList.shared.testListYoYo?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListYoYo!.endIndex)
        }
        if test.oneLegStanceTestId != nil {
            TestList.shared.testListOneLegStance?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListOneLegStance!.endIndex)
        }
        if test.tTestTestId != nil {
            TestList.shared.testListTTest?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListTTest!.endIndex)
        }
        if test.tenx5MSprintTestId != nil {
            TestList.shared.testList10x5Sprint?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListLSPT!.endIndex)
        }
        if test.tenTwentyThirtyFiveSprintId != nil {
            TestList.shared.testListLSPT?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testList10x5Sprint!.endIndex)
        }
        if test.vfmtTestId != nil {
            TestList.shared.testListVFMT?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListVFMT!.endIndex)
        }
        if test.ijtBallControllTestId != nil {
            TestList.shared.testListIJT?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListIJT!.endIndex)
        }
        if test.tvpS3TestId != nil {
            TestList.shared.testListTVPS3?.insert(Test(playerId: test.playerId, category: test.category, lsptTestId: test.lsptTestId, ktK3plusTestId: test.ktK3plusTestId, giTTestId: test.giTTestId, phvTestId: test.phvTestId, sitAndReachTestId: test.sitAndReachTestId, fatPercentageTestId: test.fatPercentageTestId, ijtBallControllTestId: test.ijtBallControllTestId, fstTestId: test.fstTestId, insaitJoyTestId: test.insaitJoyTestId, intervalShuttleRunTestId: test.intervalShuttleRunTestId, tvpS3TestId: test.tvpS3TestId, yoYoStaminaTestId: test.yoYoStaminaTestId, oneLegStanceTestId: test.oneLegStanceTestId, tTestTestId: test.tTestTestId, vfmtTestId: test.vfmtTestId, tenx5MSprintTestId: test.tenx5MSprintTestId, tenTwentyThirtyFiveSprintId: test.tenTwentyThirtyFiveSprintId, id: test.id, created: test.created, modified: test.modified), at: testListTVPS3!.endIndex)
        }
    }
}
