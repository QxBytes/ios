//
//  User.swift
//  MYND
//
//  Created by Al on 4/23/23.
//

import Foundation
import Firebase


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
    var userId: String = ""
}
func convertUserDataToDictionary(userData: UserData) -> [String: Any] {
    var dictionary: [String: Any] = [:]
    
    // Convert bookmarked set to array
    dictionary["bookmarked"] = Array(userData.bookmarked)
    
    // Convert completed set to array
    dictionary["completed"] = Array(userData.completed)
    
    // Convert checkins array to array of dictionaries
    let checkins = userData.checkins.map { (checkin) -> [String: Any] in
        var checkinDictionary: [String: Any] = [:]
        checkinDictionary["timestamp"] = checkin.timestamp
        checkinDictionary["mood"] = checkin.mood.rawValue
        checkinDictionary["notes"] = checkin.notes
        return checkinDictionary
    }
    dictionary["checkins"] = checkins
    
    // Add userId
    dictionary["userId"] = userData.userId
    
    return dictionary
}
func parseUserData(snapshot: DocumentSnapshot) -> UserData? {
    guard var data = snapshot.data(),
          let checkinArray = data["checkins"] as? [[String: Any]]
    else {
        return nil
    }
    var checkins = [Checkin]()
    for checkinDict in checkinArray {
        if let timestamp = checkinDict["timestamp"] as? Double,
           let moodRawValue = checkinDict["mood"] as? String,
           let mood = Mood(rawValue: moodRawValue),
           let notes = checkinDict["notes"] as? String {
            let checkin = Checkin(timestamp: timestamp, mood: mood, notes: notes)
            checkins.append(checkin)
        }
    }
    data.removeValue(forKey: "checkins")
    var userData = UserData(checkins: checkins)
    userData.bookmarked = Set(data["bookmarked"] as? [Int] ?? [])
    userData.completed = Set(data["completed"] as? [Int] ?? [])
    userData.userId = data["userId"] as? String ?? ""
    return userData
}
class User {
    static let shared = User()
    
    
    var bookmarked = Set<Int>()
    var completed = Set<Int>()
    var checkins: [Checkin] = []
    private init() {
        
    }
    
    
}
