//
//  WorkoutType.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/7/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

enum WorkoutType: CaseIterable {
    case backDay
    case chestDay
    case legDay
    case armDay
}

enum Days: CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

struct WorkoutSelection {
    let day1: String
    let day2: String
    let day3: String
    let day4: String
    let timeslot: String
    let timeslot2: String
    let timeslot3: String
    let timeslot4: String
    let timeslot5: String
    let timeslot6: String
    let gymId: String
    let dbReferenceDocumentId: String
    
    init(day1: String, day2: String, day3: String, day4:String, timeslot: String, timeslot2: String, timeslot3: String, timeslot4: String, timeslot5: String, timeslot6: String, gymId: String, dbReferenceDocumentId: String  ) {
        self.day1 = day1
        self.day2 = day2
        self.day3 = day3
        self.day4 = day4
        self.timeslot = timeslot
        self.timeslot2 = timeslot2
        self.timeslot3 = timeslot3
        self.timeslot4 = timeslot4
        self.timeslot5 = timeslot5
        self.timeslot6 = timeslot6
        self.gymId = gymId
        self.dbReferenceDocumentId = dbReferenceDocumentId
    }
    
    init(dict: [String: Any]) {
        self.day1 = dict["backDay"] as? String ?? "no back day listed"
        self.day2 = dict["chestDay"] as? String ?? "no chest day listed"
        self.day3 = dict["armDay"] as? String ?? "no arm day listed"
        self.day4 = dict["legDay"] as? String ?? "no leg day listed"
        self.timeslot = dict["fiveAM"] as? String ?? "no day listed"
        self.timeslot2 = dict["sixAM"] as? String ?? "no day listed"
        self.timeslot3 = dict["sevenAM"] as? String ?? "no time entered"
        self.timeslot4 = dict["nineAM"] as? String ?? "no time entered"
        self.timeslot5 = dict["tenAM"] as? String ?? "no time entered"
        self.timeslot6 = dict["eightAM"] as? String ?? "no time entered"
        self.gymId = dict["gymId"] as? String ?? "no id"
        self.dbReferenceDocumentId = dict["dbRef"] as? String ?? "no reference"
    }
}


