//
//  Workout.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 1/2/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//


import Foundation

struct Gym: Codable {
    let gymName: String
    let address: String
    let hours: String
    let contact: String
    let firstFloor: [FirstFloor]
    let secondFloor: [SecondFloor]
    let stretchingArea: [StretchingArea]
    let amenities: [Amenity]?
}

struct Amenity: Codable {
    let blinkStore: Bool
    let mensLocker: Bool
    let womensLocker: Bool
    let freshTowels: Bool
    let smartVending: Bool
    let trainers: Bool
    let stashAndDashLockers: Bool
}

struct FirstFloor: Codable {
    let trainingMachines: FirstFloorTrainingMachines
    let freeWeightsAndPlateLoaded: FirstFloorFreeWeightsAndPlateLoaded
}

struct FirstFloorFreeWeightsAndPlateLoaded: Codable {
    let kettlebells: String
    let battleRopes: String
    let crossfitCage: String
    let abBags: String
}

struct FirstFloorTrainingMachines: Codable {
    let elliptical: String
    let treadmill: String
    let armBike: String
    let tricepPushDown: String
    let seatedRow: String
    let bicepCurl: String
    let assistedDipAndPullUp: String?
    let motionDualActionPulley: String
    let latPulldown: String
}

struct SecondFloor: Codable {
    let trainingMachines: SecondFloorTrainingMachines
    let freeWeightsAndPlateLoaded: SecondFloorFreeWeightsAndPlateLoaded
}

struct SecondFloorFreeWeightsAndPlateLoaded: Codable {
    let legPressPlated: String
    let platedRow: String
    let powerRacks: String
    let benchRacks: String
    let freeWeights: String
}

struct SecondFloorTrainingMachines: Codable {
    let elliptical: String
    let treadmills: String
    let smartTreadmill: String
    let standardBikes: String
    let seatedBikes: String
    let rowMachines: String
    let stairMaster: String
    let arcTrainers: String
    let pecFlys: String
    let abCrunch: String
    let abCoaster: String
    let obliqueTwist: String
    let assistedDipAndPullUp: String
    let tricepPushDown: String
    let latPulldowns: String
    let chestPress: String
    let seatedRow: String
    let motionDualActionPulleyLg: String
    let motionDualActionPulley: String
    let calfRaise: String
    let legExtensions: String
    let legCurl: String
    let lyingLegCurl: String
    let legExtensionStanding: String
    let trumpCrushers: String
    let legPressNonPlate: String
    let smithMachines: String
}

struct StretchingArea: Codable {
    let yogaBalls: String
    let mats: String
    let medicine1: String
    let medicine2: String
    let medicine3: String
    let foamRollers: String
    let resistanceBand1: String
    let resistanceBand2: String
    let resistanceBand3: String
}
