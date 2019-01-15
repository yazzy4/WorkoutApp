//
//  Workout.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 1/2/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation


struct Workout: Codable {
    let id: String
    let title: String
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


//    let days1: Day2?
//    struct Day2: Codable {
//        let date: String?
//        let arrival: String?
//        let status: String?
//        let muscleGroup1: String?
//        let exercise1: String?
//        let exercise2: String?
//        let exercise3: String?
//        let exercise4: String?
//        let core1: String?
//        let core2: String?
//        let core3: String?
//        let day3: Day3?
//    }
//    struct Day3: Codable {
//            let date: String?
//            let arrival: String?
//            let status: String?
//            let muscleGroup1: String?
//            let exercise1: String?
//            let exercise2: String?
//            let exercise3: String?
//            let exercise4: String?
//            let core1: String?
//            let core2: String?
//            let core3: String?
//            let day4: Day4?
//        }
//            struct Day4: Codable {
//                let date: String?
//                let arrival: String?
//                let status: String?
//                let muscleGroup1: String?
//                let exercise1: String?
//                let exercise2: String?
//                let exercise3: String?
//                let exercise4: String?
//                let core1: String?
//                let core2: String?
//                let core3: String?
//                let day5: Day5?
//            }
//    struct Day5: Codable{
//            let date: String?
//            let arrival: String?
//            let status: String?
//            let muscleGroup1: String?
//            let exercise1: String?
//            let exercise2: String?
//            let exercise3: String?
//            let exercise4: String?
//            let core1: String?
//            let core2: String?
//            let core3: String?
//    }
    







//struct Day2: Codable{
//    let date: String?
//    let arrival: String?
//    let status: String?
//    let muscleGroup1: String?
//    let exercise1: String?
//    let exercise2: String?
//    let exercise3: String?
//    let exercise4: String?
//    let core1: String?
//    let core2: String?
//    let core3: String?
//        let day3: [Day3]
//}
//struct Day3: Codable{
//    let date: String?
//    let arrival: String?
//    let status: String?
//    let muscleGroup1: String?
//    let exercise1: String?
//    let exercise2: String?
//    let exercise3: String?
//    let exercise4: String?
//    let core1: String?
//    let core2: String?
//    let core3: String?
//    let day4: [Day4]
//}
//struct Day5: Codable{
//        let date: String?
//        let arrival: String?
//        let status: String?
//        let muscleGroup1: String?
//        let exercise1: String?
//        let exercise2: String?
//        let exercise3: String?
//        let exercise4: String?
//        let core1: String?
//        let core2: String?
//        let core3: String?
//}


//    let date: String?
//    let arrival: String?
//    let status: String?
//    let muscleGroup1: String?
//    let exercise1: String?
//    let exercise2: String?
//    let exercise3: String?
//    let exercise4: String?
//    let core1: String?
//    let core2: String?
//    let core3: String?






























//struct Welcome: Codable {
//    let workouts: [Workout]
//}

//struct Workout: Codable {
//    let id: String
//    let title: String
//    let workOutDays: Int?
//    let days1: [Days1]?
//    let day2: [Day]?
//    let day3: [Day]?
//    let day4: [Day]?
//    let day5: [Day]?
//    let day1: [Day]?
//    let arrival: String?
//    let status: String?
//    let exercise1: String?
//}
//
//struct Day: Codable {
//    let arrival: String
//    let status: String
//    let muscleGroup1: String?
//    let exercise1: String
//    let exercise2: String
//    let exercise3: String
//    let exercise4: String
//    let core1: String
//    let core2: String
//    let core3: String
//    let muscleGroup: String?
//}
//
//struct Days1: Codable {
//    let date: String
//    let arrival: String
//    let status: String
//    let muscleGroup1: String
//    let exercise1: String
//    let exercise2: String
//    let exercise3: String
//    let exercise4: String
//    let core1: String
//    let core2: String
//    let core3: String
//}


































//workouts": [
//    {
//        "id": "50",
//        "title": "STRENGTH PLAN 1 ",
//        "workOutDays": 5,
//        "days1": {
//            "date": "00/00/00",
//            "arrival": "0:00",
//            "status": "Busy ",
//            "muscleGroup1": "CHEST & ABS",
//            "exercise1": "Incline Bench Press",
//            "exercise2": "Face Pull",
//            "exercise3": "Flat Bench Press",
//            "exercise4": "Chest Dips",
//            "core1": "Decline Crunch",
//            "core2": "Flat Bench Leg Raises",
//            "core3": "Air Bicycles"
//        },
