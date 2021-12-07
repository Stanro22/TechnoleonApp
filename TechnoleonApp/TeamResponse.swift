//
//  TeamResponse.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/7/21.
//

import Foundation
import Combine

struct TeamResponse: Decodable {
    var teamname: String
    var organizationId: String
    var players: [Player]
    
    enum CodingKeys: String, CodingKey {
        case teamname = "name"
        case organizationId = "organizationId"
        case players = "players"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        teamname = try container.decode(String.self, forKey: .teamname)
        organizationId = try container.decode(String.self, forKey: .organizationId)
        players = try container.decode(Array.self, forKey: .players)
    }
}
