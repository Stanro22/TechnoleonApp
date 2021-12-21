//
//  UserPlayerResponse.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/21/21.
//

import Foundation

struct UserPlayerResponse: Decodable {
    let email: String
    let playerId: String
    let birthDate: String
    let weightInKg: Int
    let lengthInCm: Int
    let gender: String
    let teamRole: String
    let teamId: String
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case playerId = "playerId"
        case player = "player"
    }
    
    enum PlayerCodingKeys: String, CodingKey {
        case birthDate = "birthDate"
        case weightInKg = "weightInKg"
        case lengthInCm = "lengthInCm"
        case gender = "gender"
        case teamRole = "teamRole"
        case teamId = "teamId"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decode(String.self, forKey: .email)
        playerId = try container.decode(String.self, forKey: .playerId)
        
        let playerContainer = try container.nestedContainer( // sprites
                    keyedBy: PlayerCodingKeys.self,
                    forKey: .player
        )
        birthDate = try playerContainer.decode(String.self, forKey: .birthDate)
        weightInKg = try playerContainer.decode(Int.self, forKey: .weightInKg)
        lengthInCm = try playerContainer.decode(Int.self, forKey: .lengthInCm)
        gender = try playerContainer.decode(String.self, forKey: .gender)
        teamRole = try playerContainer.decode(String.self, forKey: .teamRole)
        teamId = try playerContainer.decode(String.self, forKey: .teamId)
    }
}
