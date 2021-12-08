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
    var email: String?
    var coachId: String?
    var teamId: String?
    var teamname: String?
    var organizationId: String?
    var players: [Player]?
    var club: String?
    var playerId: String?
    var playerName: String?
}
