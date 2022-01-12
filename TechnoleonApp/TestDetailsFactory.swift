//
//  TestDetailsFactory.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation

class TestDetailsFactory {
    //var specificTest: SpecificTest?
    
    func getSpecificTest(test: Test) -> SpecificTest{
        let child = test.getChild(test: test)
        let fields = getFields(test: test)
        let values = getTestValues(test: test, child: child)
        return SpecificTest(scoreFields: fields, values: values)
    }
    
    func getFields(test: Test) -> String {
        if test.lsptTest != nil {
            let lsptStrategy = LSPTStrategy()
            return lsptStrategy.setTestFields()
        }
        if test.ktK3PlusTest != nil {
            let ktk3Strategy = KTK3Strategy()
            return ktk3Strategy.setTestFields()
        }
        if test.giTTest != nil {
            let gitStrategy = GiTStrategy()
            return gitStrategy.setTestFields()
        }
        if test.phvTest != nil {
            let phvStrategy = PHVStrategy()
            return phvStrategy.setTestFields()
        }
        if test.sitAndReachTest != nil {
            let sitAndReachStrategy = SitAndReachStrategy()
            return sitAndReachStrategy.setTestFields()
        }
        if test.fatPercentageTest != nil {
            let fatPercentageStrategy = FatPercentageStrategy()
            return fatPercentageStrategy.setTestFields()
        }
        if test.fstTest != nil {
            let fstStrategy = FSTStrategy()
            return fstStrategy.setTestFields()
        }
        if test.insaitJoyTest != nil {
            let insaitJoyStrategy = InsaitJoyStrategy()
            return insaitJoyStrategy.setTestFields()
        }
        if test.intervalShuttleRunTest != nil {
            let shuttleRunStrategy = IntervalShuttleRunStrategy()
            return shuttleRunStrategy.setTestFields()
        }
        if test.yoYoStaminaTest != nil {
            let yoyoStrategy = YoYoStrategy()
            return yoyoStrategy.setTestFields()
        }
        if test.oneLegStanceTest != nil {
            let oneLegStanceStrategy = OneLegStanceStrategy()
            return oneLegStanceStrategy.setTestFields()
        }
        if test.tTestTest != nil {
            let tTestStrategy = TTestStrategy()
            return tTestStrategy.setTestFields()
        }
        if test.tenx5MSprintTest != nil {
            let tenx5mStrategy = Sprint10x5MStrategy()
            return tenx5mStrategy.setTestFields()
        }
        if test.tenTwentyThirtyFiveSprint != nil {
            let tenTwentyThirtyFiveStrategy = TenTwentyThirtyFiveStrategy()
            return tenTwentyThirtyFiveStrategy.setTestFields()
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
        return "Could not find test fields"
    }
    
    func getTestValues(test: Test, child: Any?) -> String {
        if test.lsptTest != nil {
            let lsptStrategy = LSPTStrategy()
            return lsptStrategy.setTestValues(test: child as! LSPTTest)
        }
        if test.ktK3PlusTest != nil {
            let ktk3Strategy = KTK3Strategy()
            return ktk3Strategy.setTestValues(test: child as! KTK3Test)
        }
        if test.giTTest != nil {
            let gitStrategy = GiTStrategy()
            return gitStrategy.setTestValues(test: child as! GiTTest)
        }
        if test.phvTest != nil {
            let phvStrategy = PHVStrategy()
            return phvStrategy.setTestValues(test: child as! PHVTest)
        }
        if test.sitAndReachTest != nil {
            let sitAndReachStrategy = SitAndReachStrategy()
            return sitAndReachStrategy.setTestValues(test: child as! SitAndReachTest)
        }
        if test.fatPercentageTest != nil {
            let fatPercentageStrategy = FatPercentageStrategy()
            return fatPercentageStrategy.setTestValues(test: child as! FatPercentageTest)
        }
        if test.fstTest != nil {
            let fstStrategy = FSTStrategy()
            return fstStrategy.setTestValues(test: child as! FSTTest)
        }
        if test.insaitJoyTest != nil {
            let insaitJoyStrategy = InsaitJoyStrategy()
            return insaitJoyStrategy.setTestValues(test: child as! InsaitJoyTest)
        }
        if test.intervalShuttleRunTest != nil {
            let shuttleRunStrategy = IntervalShuttleRunStrategy()
            return shuttleRunStrategy.setTestValues(test: child as! IntervalShuttleRunTest)
        }
        if test.yoYoStaminaTest != nil {
            let yoyoStrategy = YoYoStrategy()
            return yoyoStrategy.setTestValues(test: child as! YoYoTest)
        }
        if test.oneLegStanceTest != nil {
            let oneLegStanceStrategy = OneLegStanceStrategy()
            return oneLegStanceStrategy.setTestValues(test: child as! OneLegStanceTest)
        }
        if test.tTestTest != nil {
            let tTestStrategy = TTestStrategy()
            return tTestStrategy.setTestValues(test: child as! TTestTest)
        }
        if test.tenx5MSprintTest != nil {
            let tenx5mStrategy = Sprint10x5MStrategy()
            return tenx5mStrategy.setTestValues(test: child as! Sprint10x5Test)
        }
        if test.tenTwentyThirtyFiveSprint != nil {
            let tenTwentyThirtyFiveStrategy = TenTwentyThirtyFiveStrategy()
            return tenTwentyThirtyFiveStrategy.setTestValues(test: child as! TenTwentyThirtyFiveSprintTest)
        }
        return "Could not find test values"
    }
    
}
