//
//  Test.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import Foundation

struct Test: Decodable, Hashable{
    let playerId: String
    //let category: String
    
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
