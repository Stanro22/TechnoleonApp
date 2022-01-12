//
//  TestResponse.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/12/22.
//

import Foundation
import Combine

struct TestResponse: Decodable, Hashable {
    let playerId: String?
    let category: String?
    let lsptTestId: String?
    let lsptTest: LSPTTest?
    let ktK3plusTestId: String?
    let ktK3plusTest: KTK3Test?
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
}
