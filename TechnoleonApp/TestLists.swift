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
            TestList.shared.testListLSPT?.insert(test, at: testListLSPT!.endIndex)
        }
        if test.ktK3plusTestId != nil {
            TestList.shared.testListKTK3?.insert(test, at: testListKTK3!.endIndex)
        }
        if test.giTTestId != nil {
            TestList.shared.testListGIT?.insert(test, at: testListGIT!.endIndex)
        }
        if test.phvTestId != nil {
            TestList.shared.testListPHV?.insert(test, at: testListPHV!.endIndex)
        }
        if test.sitAndReachTestId != nil {
            TestList.shared.testListsitAndReach?.insert(test, at: testListsitAndReach!.endIndex)
        }
        if test.fatPercentageTestId != nil {
            TestList.shared.testListfatPercentage?.insert(test, at: testListfatPercentage!.endIndex)
        }
        if test.fstTestId != nil {
            TestList.shared.testListFST?.insert(test, at: testListFST!.endIndex)
        }
        if test.insaitJoyTestId != nil {
            TestList.shared.testListInsaitJoy?.insert(test, at: testListInsaitJoy!.endIndex)
        }
        if test.intervalShuttleRunTestId != nil {
            TestList.shared.testListShuttleRun?.insert(test, at: testListShuttleRun!.endIndex)
        }
        if test.yoYoStaminaTestId != nil {
            TestList.shared.testListYoYo?.insert(test, at: testListYoYo!.endIndex)
        }
        if test.oneLegStanceTestId != nil {
            TestList.shared.testListOneLegStance?.insert(test, at: testListOneLegStance!.endIndex)
        }
        if test.tTestTestId != nil {
            TestList.shared.testListTTest?.insert(test, at: testListTTest!.endIndex)
        }
        if test.tenx5MSprintTestId != nil {
            TestList.shared.testList10x5Sprint?.insert(test, at: testListLSPT!.endIndex)
        }
        if test.tenTwentyThirtyFiveSprintId != nil {
            TestList.shared.testListLSPT?.insert(test, at: testList10x5Sprint!.endIndex)
        }
        if test.vfmtTestId != nil {
            TestList.shared.testListVFMT?.insert(test, at: testListVFMT!.endIndex)
        }
        if test.ijtBallControllTestId != nil {
            TestList.shared.testListIJT?.insert(test, at: testListIJT!.endIndex)
        }
        if test.tvpS3TestId != nil {
            TestList.shared.testListTVPS3?.insert(test, at: testListTVPS3!.endIndex)
        }
    }
}
