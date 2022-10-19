//
//  UserPlayerResponse.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/21/21.
//

import Foundation

struct UserResponse: Decodable {
    //let username: String
    let type: String
    let name: String
    let gender: String
    let date_of_birth: String
    let weight_in_kg: String
    let height_in_cm: String
    let player_id: String
    let coach_clubs: String
    let teams: [Team]
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case name = "full_name"
        case gender = "gender"
        case date_of_birth = "birth_date"
        case weight_in_kg = "weight"
        case height_in_cm = "height"
        case player_id = "player_id"
        case coach_clubs = "coach_clubs"
        case teams = "teams"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        name = try container.decode(String.self, forKey: .name)
        gender = try container.decode(String.self, forKey: .gender)
        date_of_birth = try container.decode(String.self, forKey: .date_of_birth)
        weight_in_kg = try container.decode(String.self, forKey: .weight_in_kg)
        height_in_cm = try container.decode(String.self, forKey: .height_in_cm)
        player_id = try container.decode(String.self, forKey: .player_id)
        coach_clubs = try container.decode(String.self, forKey: .coach_clubs)
        teams = try container.decode([Team].self, forKey: .teams)
    }
    
    
    /*
    //---OLD INHOLLAND PROJECT---
    let email: String
    let playerId: String
    let birthDate: String
    let weightInKg: String
    let lengthInCm: String
    let gender: String
    let teamRole: String
    let teamId: String
    let tests: [Test]
    
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
        case tests = "tests"
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
        weightInKg = try playerContainer.decode(String.self, forKey: .weightInKg)
        lengthInCm = try playerContainer.decode(String.self, forKey: .lengthInCm)
        gender = try playerContainer.decode(String.self, forKey: .gender)
        teamRole = try playerContainer.decode(String.self, forKey: .teamRole)
        teamId = try playerContainer.decode(String.self, forKey: .teamId)
        tests = try playerContainer.decode(Array.self, forKey: .tests)
    }*/
}
