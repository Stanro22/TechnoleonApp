//
//  LoggedInUser.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/6/21.
//

import Foundation

final class LoggedInUser : ObservableObject {
    static let shared = LoggedInUser()
    
    var userId: String?
    var userRole: String?
    var name: String?
    
    var teamId: String?
}
