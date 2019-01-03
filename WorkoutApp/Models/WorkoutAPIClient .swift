//
//  WorkoutAPIClient .swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 1/2/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

final class WorkoutAPIClient {
    static func getWorkout(completionHandler: @escaping (Error?, [Workout]?) -> Void) {
        let workoutEndpoint = "https://5c2d2073b8051f0014cd4754.mockapi.io/api/v1/Plans"
        NetworkHelper.shared.performDataTask(endpointURLString: workoutEndpoint, httpMethod: "GET", httpData: nil) { (appError, data, httpResponse) in
            
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do{
                    var workouts = try JSONDecoder().decode([Workout].self, from: data)
                    workouts = workouts.sorted { $0.title > $1.title }
                    completionHandler(nil, workouts)
            } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }

    }
    static func updateWorkout(data: Data, completion: @escaping (Bool) -> Void) {
        let updateWorkoutEndpoint = "https://5c2d2073b8051f0014cd4754.mockapi.io/api/v1/Plans"
        NetworkHelper.shared.uploadData(endpointString: updateWorkoutEndpoint, httpMethod: "POST", httpData: data) { (appError, data, httpResponse) in
            if let _ = appError {
                completion(false)
            } else if let _ = data {
                completion(true)
            }
            
        }
        
    }
}
