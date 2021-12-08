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
    @Published var userRole: String?
    var name: String?
    var email: String?
    //var coachId: String?
    var teamId: String?
    @Published var teamname: String?
    var organizationId: String?
    var players: [Player]?
    var club: String?
    var playerId: String?
    @Published var playerName: String?
}
