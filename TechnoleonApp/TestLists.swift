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
            if TestList.shared.testListLSPT == nil{
                TestList.shared.testListLSPT = [Test]()
            }
            TestList.shared.testListLSPT?.append(test)
        }
        if test.ktK3plusTestId != nil {
            if TestList.shared.testListKTK3 == nil{
                TestList.shared.testListKTK3 = [Test]()
            }
            TestList.shared.testListKTK3?.append(test)
        }
        if test.giTTestId != nil {
            if TestList.shared.testListGIT == nil{
                TestList.shared.testListGIT = [Test]()
            }
            TestList.shared.testListGIT?.append(test)
        }
        if test.phvTestId != nil {
            if TestList.shared.testListPHV == nil{
                TestList.shared.testListPHV = [Test]()
            }
            TestList.shared.testListPHV?.append(test)
        }
        if test.sitAndReachTestId != nil {
            if TestList.shared.testListsitAndReach == nil{
                TestList.shared.testListsitAndReach = [Test]()
            }
            TestList.shared.testListsitAndReach?.append(test)
        }
        if test.fatPercentageTestId != nil {
            if TestList.shared.testListfatPercentage == nil{
                TestList.shared.testListfatPercentage = [Test]()
            }
            TestList.shared.testListfatPercentage?.append(test)
        }
        if test.fstTestId != nil {
            if TestList.shared.testListFST == nil{
                TestList.shared.testListFST = [Test]()
            }
            TestList.shared.testListFST?.append(test)
        }
        if test.insaitJoyTestId != nil {
            if TestList.shared.testListInsaitJoy == nil{
                TestList.shared.testListInsaitJoy = [Test]()
            }
            TestList.shared.testListInsaitJoy?.append(test)
        }
        if test.intervalShuttleRunTestId != nil {
            if TestList.shared.testListShuttleRun == nil{
                TestList.shared.testListShuttleRun = [Test]()
            }
            TestList.shared.testListShuttleRun?.append(test)
        }
        if test.yoYoStaminaTestId != nil {
            if TestList.shared.testListYoYo == nil{
                TestList.shared.testListYoYo = [Test]()
            }
            TestList.shared.testListYoYo?.append(test)
        }
        if test.oneLegStanceTestId != nil {
            if TestList.shared.testListOneLegStance == nil{
                TestList.shared.testListOneLegStance = [Test]()
            }
            TestList.shared.testListOneLegStance?.append(test)
        }
        if test.tTestTestId != nil {
            if TestList.shared.testListTTest == nil{
                TestList.shared.testListTTest = [Test]()
            }
            TestList.shared.testListTTest?.append(test)
        }
        if test.tenx5MSprintTestId != nil {
            if TestList.shared.testList10x5Sprint == nil{
                TestList.shared.testList10x5Sprint = [Test]()
            }
            TestList.shared.testList10x5Sprint?.append(test)
        }
        if test.tenTwentyThirtyFiveSprintId != nil {
            if TestList.shared.testListTenTwentyThirtyFiveSprint == nil{
                TestList.shared.testListTenTwentyThirtyFiveSprint = [Test]()
            }
            TestList.shared.testListTenTwentyThirtyFiveSprint?.append(test)
        }
        if test.vfmtTestId != nil {
            if TestList.shared.testListVFMT == nil{
                TestList.shared.testListVFMT = [Test]()
            }
            TestList.shared.testListVFMT?.append(test)
        }
        if test.ijtBallControllTestId != nil {
            if TestList.shared.testListIJT == nil{
                TestList.shared.testListIJT = [Test]()
            }
            TestList.shared.testListIJT?.append(test)
        }
        if test.tvpS3TestId != nil {
            if TestList.shared.testListTVPS3 == nil{
                TestList.shared.testListTVPS3 = [Test]()
            }
            TestList.shared.testListTVPS3?.append(test)
        }
    }
}
