//
//  WorkoutProgram.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/4/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

struct Workout: Codable {
    let id: String
    let title: String
    var arrival: String
    let status: String
    var description: String
    let workOutDays: String?
    let days: [Days]?
    
    struct Days: Codable {
        let dayNumber: Int
        let id: String?
        let date: String?
        let arrival: String?
        let status: String?
        let muscleGroup1: String?
        let exercise1: String?
        let exercise2: String?
        let exercise3: String?
        let exercise4: String?
        let core1: String?
        let core2: String?
        let core3: String?
    }
    
}
