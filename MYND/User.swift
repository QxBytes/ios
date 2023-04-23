//
//  User.swift
//  MYND
//
//  Created by Al on 4/23/23.
//

import Foundation


enum Mood: Int {
    case AWFUL = 0
    case BAD = 1
    case OKAY = 2
    case GOOD = 3
    case GREAT = 4
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
