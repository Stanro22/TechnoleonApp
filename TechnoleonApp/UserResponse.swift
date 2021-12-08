//
//  UserResponse.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/7/21.
//

import Foundation

struct UserResponse: Decodable {
    let email: String
    //let coachId: String
    let teamId: String
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        //case coachId = "coachId"
        case coach = "coach"
    }
    
    enum CoachCodingKeys: String, CodingKey {
        case teamId = "teamId"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        //coachId = try container.decode(String.self, forKey: .coachId)
        
        let CoachContainer = try container.nestedContainer( // sprites
                    keyedBy: CoachCodingKeys.self,
                    forKey: .coach
        )
        teamId = try CoachContainer.decode(String.self, forKey: .teamId)
    }
}


