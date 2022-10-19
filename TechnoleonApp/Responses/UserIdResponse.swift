//
//  UserResponse.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/7/21.
//

import Foundation

struct UserIdResponse: Decodable {
    let user_id: String
    
    enum CodingKeys: String, CodingKey {
        case user_id = "user_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try container.decode(String.self, forKey: .user_id)
    }
}


