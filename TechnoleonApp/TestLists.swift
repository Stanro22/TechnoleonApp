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
    @Published var playerListKTK3: [Player]? = [Player]()
    @Published var testListLSPT: [Test]?
    @Published var playerListLSPT: [Player]? = [Player]()
    @Published var testListGIT: [Test]?
    @Published var playerListGIT: [Player]? = [Player]()
    @Published var testListPHV: [Test]?
    @Published var playerListPHV: [Player]? = [Player]()
    @Published var testListsitAndReach: [Test]?
    @Published var playerListsitAndReach: [Player]? = [Player]()
    @Published var testListfatPercentage: [Test]?
    @Published var playerListfatPercentage: [Player]? = [Player]()
    @Published var testListIJT: [Test]?
    @Published var playerListIJT: [Player]? = [Player]()
    @Published var testListFST: [Test]?
    @Published var playerListFST: [Player]? = [Player]()
    @Published var testListInsaitJoy: [Test]?
    @Published var playerListInsaitJoy: [Player]? = [Player]()
    @Published var testListShuttleRun: [Test]?
    @Published var playerListShuttleRun: [Player]? = [Player]()
    @Published var testListOneLegStance: [Test]?
    @Published var playerListOneLegStance: [Player]? = [Player]()
    @Published var testListTVPS3: [Test]?
    @Published var playerListTVPS3: [Player]? = [Player]()
    @Published var testListTTest: [Test]?
    @Published var playerListTTest: [Player]? = [Player]()
    @Published var testListVFMT: [Test]?
    @Published var playerListVFMT: [Player]? = [Player]()
    @Published var testList10x5Sprint: [Test]?
    @Published var playerList10x5Sprint: [Player]? = [Player]()
    @Published var testListYoYo: [Test]?
    @Published var playerListYoYo: [Player]? = [Player]()
    @Published var testListTenTwentyThirtyFiveSprint: [Test]?
    @Published var playerListTenTwentyThirtyFiveSprint: [Player]? = [Player]()
    
    func addToList(test: Test, player: Player){
        if test.lsptTestId != nil {
            if TestList.shared.testListLSPT == nil{
                TestList.shared.testListLSPT = [Test]()
            }
            if TestList.shared.playerListLSPT!.contains(player) == false{
                TestList.shared.playerListLSPT!.append(player)
            }
            TestList.shared.testListLSPT?.append(test)
        }
        if test.ktK3plusTestId != nil {
            if TestList.shared.testListKTK3 == nil{
                TestList.shared.testListKTK3 = [Test]()
            }
            if TestList.shared.playerListKTK3!.contains(player) == false{
                TestList.shared.playerListKTK3!.append(player)
            }
            TestList.shared.testListKTK3?.append(test)
        }
        if test.giTTestId != nil {
            if TestList.shared.testListGIT == nil{
                TestList.shared.testListGIT = [Test]()
            }
            if TestList.shared.playerListGIT!.contains(player) == false{
                TestList.shared.playerListGIT!.append(player)
            }
            TestList.shared.testListGIT?.append(test)
        }
        if test.phvTestId != nil {
            if TestList.shared.testListPHV == nil{
                TestList.shared.testListPHV = [Test]()
            }
            if TestList.shared.playerListPHV!.contains(player) == false{
                TestList.shared.playerListPHV!.append(player)
            }
            TestList.shared.testListPHV?.append(test)
        }
        if test.sitAndReachTestId != nil {
            if TestList.shared.testListsitAndReach == nil{
                TestList.shared.testListsitAndReach = [Test]()
            }
            if TestList.shared.playerListsitAndReach!.contains(player) == false{
                TestList.shared.playerListsitAndReach!.append(player)
            }
            TestList.shared.testListsitAndReach?.append(test)
        }
        if test.fatPercentageTestId != nil {
            if TestList.shared.testListfatPercentage == nil{
                TestList.shared.testListfatPercentage = [Test]()
            }
            if TestList.shared.playerListfatPercentage!.contains(player) == false{
                TestList.shared.playerListfatPercentage!.append(player)
            }
            TestList.shared.testListfatPercentage?.append(test)
        }
        if test.fstTestId != nil {
            if TestList.shared.testListFST == nil{
                TestList.shared.testListFST = [Test]()
            }
            if TestList.shared.playerListFST!.contains(player) == false{
                TestList.shared.playerListFST!.append(player)
            }
            TestList.shared.testListFST?.append(test)
        }
        if test.insaitJoyTestId != nil {
            if TestList.shared.testListInsaitJoy == nil{
                TestList.shared.testListInsaitJoy = [Test]()
            }
            if TestList.shared.playerListInsaitJoy!.contains(player) == false{
                TestList.shared.playerListInsaitJoy!.append(player)
            }
            TestList.shared.testListInsaitJoy?.append(test)
        }
        if test.intervalShuttleRunTestId != nil {
            if TestList.shared.testListShuttleRun == nil{
                TestList.shared.testListShuttleRun = [Test]()
            }
            if TestList.shared.playerListShuttleRun!.contains(player) == false{
                TestList.shared.playerListShuttleRun!.append(player)
            }
            TestList.shared.testListShuttleRun?.append(test)
        }
        if test.yoYoStaminaTestId != nil {
            if TestList.shared.testListYoYo == nil{
                TestList.shared.testListYoYo = [Test]()
            }
            if TestList.shared.playerListYoYo!.contains(player) == false{
                TestList.shared.playerListYoYo!.append(player)
            }
            TestList.shared.testListYoYo?.append(test)
        }
        if test.oneLegStanceTestId != nil {
            if TestList.shared.testListOneLegStance == nil{
                TestList.shared.testListOneLegStance = [Test]()
            }
            if TestList.shared.playerListOneLegStance!.contains(player) == false{
                TestList.shared.playerListOneLegStance!.append(player)
            }
            TestList.shared.testListOneLegStance?.append(test)
        }
        if test.tTestTestId != nil {
            if TestList.shared.testListTTest == nil{
                TestList.shared.testListTTest = [Test]()
            }
            if TestList.shared.playerListTTest!.contains(player) == false{
                TestList.shared.playerListTTest!.append(player)
            }
            TestList.shared.testListTTest?.append(test)
        }
        if test.tenx5MSprintTestId != nil {
            if TestList.shared.testList10x5Sprint == nil{
                TestList.shared.testList10x5Sprint = [Test]()
            }
            if TestList.shared.playerList10x5Sprint!.contains(player) == false{
                TestList.shared.playerList10x5Sprint!.append(player)
            }
            TestList.shared.testList10x5Sprint?.append(test)
        }
        if test.tenTwentyThirtyFiveSprintId != nil {
            if TestList.shared.testListTenTwentyThirtyFiveSprint == nil{
                TestList.shared.testListTenTwentyThirtyFiveSprint = [Test]()
            }
            if TestList.shared.playerListTenTwentyThirtyFiveSprint!.contains(player) == false{
                TestList.shared.playerListTenTwentyThirtyFiveSprint!.append(player)
            }
            TestList.shared.testListTenTwentyThirtyFiveSprint?.append(test)
        }
        if test.vfmtTestId != nil {
            if TestList.shared.testListVFMT == nil{
                TestList.shared.testListVFMT = [Test]()
            }
            if TestList.shared.playerListVFMT!.contains(player) == false{
                TestList.shared.playerListVFMT!.append(player)
            }
            TestList.shared.testListVFMT?.append(test)
        }
        if test.ijtBallControllTestId != nil {
            if TestList.shared.testListIJT == nil{
                TestList.shared.testListIJT = [Test]()
            }
            if TestList.shared.playerListIJT!.contains(player) == false{
                TestList.shared.playerListIJT!.append(player)
            }
            TestList.shared.testListIJT?.append(test)
        }
        if test.tvpS3TestId != nil {
            if TestList.shared.testListTVPS3 == nil{
                TestList.shared.testListTVPS3 = [Test]()
            }
            if TestList.shared.playerListTVPS3!.contains(player) == false{
                TestList.shared.playerListTVPS3!.append(player)
            }
            TestList.shared.testListTVPS3?.append(test)
        }
    }
}
