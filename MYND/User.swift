//
//  User.swift
//  MYND
//
//  Created by Al on 4/23/23.
//

import Foundation


enum Mood: String {
    case AWFUL = "Awful"
    case BAD = "Bad"
    case OKAY = "Okay"
    case GOOD = "Good"
    case GREAT = "Great"
}
struct Checkin {
    var timestamp: Double
    var mood: Mood
    var notes: String
}
struct UserData {
    var bookmarked = Set<Int>()
    var completed = Set<Int>()
    var checkins: [Checkin]
}
class User {
    static let shared = User()
    
    
    var bookmarked = Set<Int>()
    var completed = Set<Int>()
    var checkins: [Checkin] = []
    private init() {
        
    }
    
    
}
