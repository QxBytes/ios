//
//  DB.swift
//  MYND
//
//  Created by Al on 4/27/23.
//
import SwiftUI
import Firebase
import FirebaseCore
import Foundation


struct DB {
    var db = Firestore.firestore()
}
func create(db: Firestore, userData: UserData) {
    let users_collection = db.collection("users")
    users_collection.document(userData.userId).setData(
        convertUserDataToDictionary(userData: userData)
    ) { err in
        if let err = err {
            print("Error writing: \(err)")
        } else {
            print("Success in writing document")
        }
    }
}
func read(db: Firestore, doc_id: String, completion: @escaping (DocumentSnapshot?, Error?) -> Void) {
    let users_collection = db.collection("users")
    users_collection.document(doc_id).getDocument { (document, error) in
        if let error = error {
            completion(nil, error)
        } else {
            completion(document, nil)
        }
    }
}
