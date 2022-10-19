//
//  LoginRequest.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/4/21.
//

import Foundation

/*struct LoginRequest: Encodable{
    let email: String?
    let password: String?
}*/

struct LoginRequest: Encodable{
    let grant_type: String?
    let client_id: String?
    let email: String?
    let password: String?
}
