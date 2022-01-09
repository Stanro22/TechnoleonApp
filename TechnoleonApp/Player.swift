//
//  Player.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/7/21.
//

import Foundation

struct Player: Decodable, Hashable{
    var playerId: String
    var playerName: String
    var playerShuttleRunScore: Int? = 0
    var playerYoYoScore: Int? = 0
    //var tests: [Test]
    
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
        playerName = try userContainer.decode(String.self, forKey: .playername)
    }
}
