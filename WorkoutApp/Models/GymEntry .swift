//
//  GymEntry .swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/7/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation
struct GymEntry {
    let workoutType: String
    let day: String
    let startTime: String
    let endTime: String
    let gymId: String
    let dbReferenceDocumentId: String // reference to the race review document, useful for e.g deleting
    
    init(workoutType: String, day: String, startTime: String, endTime: String, gymId: String, dbReference: String) {
        self.workoutType = workoutType
        self.day = day
        self.startTime = startTime
        self.endTime = endTime
        self.gymId = gymId
        self.dbReferenceDocumentId = dbReference
    }
    
    init(dict: [String: Any]) {
        self.workoutType = dict["workout"] as? String ?? "no workout name"
        self.day = dict["day"] as? String ?? "no day listed"
        self.startTime = dict["startTime"] as? String ?? "no time listed"
        self.endTime = dict["endTime"] as? String ?? "no time listed"
        self.gymId = dict["gymId"] as? String ?? "no reviewerId"
        self.dbReferenceDocumentId = dict["dbReference"] as? String ?? "no dbReference"
    }
    
    
}

