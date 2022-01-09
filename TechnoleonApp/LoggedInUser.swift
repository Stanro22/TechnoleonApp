//
//  LoggedInUser.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/6/21.
//

import Foundation

final class LoggedInUser : ObservableObject {
    //trainer and player
    static let shared = LoggedInUser()
    var userId: String?
    @Published var userRole: String?
    var name: String?
    var email: String?
    var playerId: String?
    var teamId: String?
    @Published var teamname: String?
    
    //trainer
    //var coachId: String?
    var organizationId: String?
    var players: [Player]?
    var club: String?
    @Published var playerName: String?
    var testList: [Test]?
    
    //player
    var birthDate: String?
    var weightInKg: Int?
    var lengthInCm: Int?
    var gender: String?
    @Published var teamRole: String?
}
