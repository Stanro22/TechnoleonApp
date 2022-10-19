//
//  Player.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/7/21.
//

import Foundation
import Combine

struct Player: Decodable, Hashable {
    var player_id: String?
    var player_name: String?
    var tests: [Test]?
    var date_of_birth: String?
    var weight_in_kg: String?
    var height_in_cm: String?
    var level: String?
    var favorite_position: String?
    var team_role: String?
    var gender: String?
    var team_id: String?
    //var team: Team?
    var email: String?
    //var user: User?
    
    //--OLD INHOLLAND PROJECT--- needed for shuttle run and yoyo views
    var playerShuttleRunScore: Int? = 0
    var playerYoYoScore: Int? = 0
    
    enum CodingKeys: String, CodingKey{
        case player_id = "player_id"
        case player_name = "player_name"
        case tests = "tests"
        case date_of_birth = "date_of_birth"
        case weight_in_kg = "weight_in_kg"
        case height_in_cm = "height_in_cm"
        case level = "level"
        case favorite_position = "favorite_position"
        case team_role = "team_role"
        case gender = "gender"
        case team_id = "team_id"
        //case team = "team"
        case email = "email"
        //case user = "user"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        player_id = try container.decode(String.self, forKey: .player_id)
        player_name = try container.decode(String.self, forKey: .player_name)
        tests = try container.decode(Array.self, forKey: .tests)
        date_of_birth = try container.decode(String.self, forKey: .date_of_birth)
        weight_in_kg = try container.decode(String.self, forKey: .weight_in_kg)
        height_in_cm = try container.decode(String.self, forKey: .height_in_cm)
        level = try container.decode(String.self, forKey: .level)
        favorite_position = try container.decode(String.self, forKey: .favorite_position)
        team_role = try container.decode(String.self, forKey: .team_role)
        gender = try container.decode(String.self, forKey: .gender)
        team_id = try container.decode(String.self, forKey: .team_id)
        //team = try container.decode(Team.self, forKey: .team)
        email = try container.decode(String.self, forKey: .email)
        //user = try container.decode(User.self, forKey: .user)
    }
    
    /*
    //--- OLD INHOLLAND PROJECT---
    var playerId: String
    var playerName: String
    var playerShuttleRunScore: Int? = 0
    var playerYoYoScore: Int? = 0
    var tests: [Test]?
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
        case tests = "tests"
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
        tests = try container.decode(Array.self, forKey: .tests)
    }*/
}
