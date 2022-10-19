//
//  LoggedInUser.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/6/21.
//

import Foundation

final class User : ObservableObject {
    static let shared = User()
    var username: String?
    var type: String?
    var name: String?
    var email: String?
    var gender: String?
    var date_of_birth: String?
    var weight_in_kg: String?
    var height_in_cm: String?
    var player_id: String?
    var coach_clubs: String?
    var teams: [Team]?
    var user_id: String?
    
    //---OLD INHOLLAND PROJECT--- needed for not crashing/giving errors (remove/change in future)
    @Published var testList: [Test]?
    
    /*
    //---OLD INHOLLAND PROJECT---
    //trainer and player
    static let shared = User()
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
    @Published var players: [Player]?
    var club: String?
    @Published var playerName: String?
    
    //player
    var birthDate: String?
    var weightInKg: Int?
    var lengthInCm: Int?
    var gender: String?
    @Published var teamRole: String?*/
    
}	
