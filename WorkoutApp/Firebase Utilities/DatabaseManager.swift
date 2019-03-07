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
    
    static func postWorkoutToDatabase(gymEntry: GymEntry, workoutType: WorkoutSelection) {
        var ref: DocumentReference? = nil
        ref = firebaseDB.collection(DatabaseKeys.GymCollectionKey).addDocument(data: [
            "workout"    : gymEntry.workoutType,
            "day"  : gymEntry.day,
            "startTime"  : gymEntry.startTime,
            "endTime"    : gymEntry.endTime,
            "gymId"   : gymEntry.gymId,
            "dbReference" : gymEntry.dbReferenceDocumentId,
            "backDay" : workoutType.day1,
            "chestDay" : workoutType.day2,
            "armDay" : workoutType.day3,
            "legDay" : workoutType.day4,
            "fiveAM" : workoutType.timeslot,
            "sixAM" : workoutType.timeslot2,
            "sevenAM" : workoutType.timeslot3,
            "nineAM" : workoutType.timeslot4,
            "tenAM" : workoutType.timeslot5,
            "eightAM" : workoutType.timeslot6,
            "gymId" : workoutType.gymId,
            "dbRef" : workoutType.dbReferenceDocumentId
            ], completion: { (error) in
                if let error = error {
                    print("posing workout failed with error: \(error)")
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
