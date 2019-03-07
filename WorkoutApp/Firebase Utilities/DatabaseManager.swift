//
//  DatabaseManager.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/5/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class DatabaseManager {
    
    private init() {}
    
    static let firebaseDB: Firestore = {
        // gets a reference to firestore database
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        return db
    }()
    
    static func postWorkoutToDatabase(gymEntry: GymEntry) {
        var ref: DocumentReference? = nil
        ref = firebaseDB.collection(DatabaseKeys.GymCollectionKey).addDocument(data: [
            "workout"    : gymEntry.workoutType,
            "day"  : gymEntry.day,
            "startTime"  : gymEntry.startTime,
            "endTime"    : gymEntry.endTime,
            "gymId"   : gymEntry.gymId,
            "dbReference" : gymEntry.dbReferenceDocumentId
            ], completion: { (error) in
                if let error = error {
                    print("posing race failed with error: \(error)")
                } else {
                    print("post created at ref: \(ref?.documentID ?? "no doc id")")
                    
                    // updating a firestore dcoument:
                    // here we are updating the field dbReference for race review,
                    // useful for e.g deleting a (race review) document
                    DatabaseManager.firebaseDB.collection(DatabaseKeys.GymCollectionKey)
                        .document(ref!.documentID)
                        .updateData(["dbReference": ref!.documentID], completion: { (error) in
                            if let error = error {
                                print("error updating field: \(error)")
                            } else {
                                print("field updated")
                            }
                        })
                }
        })
    }
    
}
