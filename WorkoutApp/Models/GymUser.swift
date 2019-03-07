//
//  GymUser.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 3/7/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

struct GymUser {
    let username: String?
    let imageURL: String?
    
    init(dict: [String: Any]) {
        self.username = dict["username"] as? String ?? "no username"
        self.imageURL = dict["imageURL"] as? String ?? "no imageURL"
    }
}
