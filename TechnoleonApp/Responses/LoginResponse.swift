//
//  LoginResponse.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/4/21.
//

import Foundation
import Combine

struct LoginResponse: Decodable {
    let accesToken: String

    enum CodingKeys: String, CodingKey {
        case accesToken = "token"
    }
}
