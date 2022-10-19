//
//  Team.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/7/21.
//

import Foundation

struct Team: Decodable{
    var team_id: String?
    var team_id_p: String?
    var team_name: String?
    var players: [Player]?
    var coaches: String?
    
    enum CodingKeys: String, CodingKey {
        case team_id = "team_id"
        case team_id_p = "team_id_p"
        case team_name = "team_name"
        case players = "players"
        case coaches = "coaches"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.team_id = try container.decodeIfPresent(String.self, forKey: .team_id)
        self.team_id_p = try container.decodeIfPresent(String.self, forKey: .team_id_p)
        self.team_name = try container.decodeIfPresent(String.self, forKey: .team_name)
        self.players = try container.decodeIfPresent([Player].self, forKey: .players)
        self.coaches = try container.decodeIfPresent(String.self, forKey: .coaches)
    }
    
    //---OLD INHOLLAND PROJECT---
    //var organizationId: String?
}
