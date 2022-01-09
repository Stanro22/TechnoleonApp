//
//  Test.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import Foundation

struct Test: Decodable, Hashable{
    let playerId: String
    //let player: Player?
    //let category: String
    //let skills: List<Any?>
    //let lsptTestId: String
    //let lsptTest: LSPTTest?
    //let ktk3PlusTestId: String
    //let ktk3PlusTest: KTK3Test?
    //let giTTestId: String
    //let giTTest: GiTTest?
    //let phvTestId: String
    //let phvTest: PHVTest?
    //let sitAndReachTestId: String
    //let sitAndReachTest: SitAndReachTest?
    //let fatPercentageTestId: String
    //let fatPercentageTest: FatPercentageTest?
    //let fstTestId: String
    //let fstTest: FSTTest?
    //let insaitJoyTestId: String
    //let insaitJoyTTest: InsaitJoyTTest?
    //let intervalShuttleRunTestId: String
    //let intervalShuttleRunTest: IntervalShuttleRunTest?
    //let yoyoTestId: String
    //let yoyoTest: YoYoTest?
    //let oneLegStanceTestId: String
    //let oneLegStanceTest: OneLegStanceTest?
    //let tTestTestId: String
    //let tTestTest: TTestTest?
    //let sprint10x5TestId: String
    //let sprint10x5Test: Sprint10x5Test?
    //let id: String
    //let createdAt: String
    //let modified: String
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
    }
    
    enum UserCodingKeys: String, CodingKey {
        case playerId = "playerId"
        case playername = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let userContainer = try container.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .user)
        playerId = try userContainer.decode(String.self, forKey: .playerId)
        //category = try userContainer.decode(String.self, forKey: .category)
    }
}
