//
//  WorkoutAPIClient .swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 1/2/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

final class WorkoutAPIClient {
    static func getWorkout(completionHandler: @escaping (AppError?, [Workout]?) -> Void) {
        let workoutEndpoint = "http://nmjr3.mocklab.io/WorkoutApp"
        NetworkHelper.shared.performDataTask(endpointURLString: workoutEndpoint, httpMethod: "GET", httpData: nil) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            guard let response = httpResponse,
                (200...299).contains(response.statusCode) else {
                    let statusCode = httpResponse?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
                    return
            }
            if let data = data {
                do{
                    let workouts = try JSONDecoder().decode([Workout].self, from: data)
                
                    completionHandler(nil, workouts)
            } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
              
            }
            
        }
    
    
    }
    
    static func updateWorkout(data: Data, completion: @escaping (Bool) -> Void) {
        let updateWorkoutEndpoint = "http://nmjr3.mocklab.io/WorkoutApp"
        NetworkHelper.shared.uploadData(endpointString: updateWorkoutEndpoint, httpMethod: "POST", httpData: data) { (appError, data, httpResponse) in
            if let _ = appError {
                completion(false)
            } else if let _ = data {
                completion(true)
            }
            
        }
        
    }
    

    
   
}


//final class DaysAPIClient{
//    static func getDays (completionHandler: @escaping (AppError?, Day1?) -> Void) {
//        let workoutEndpoint = "http://nmjr3.mocklab.io/WorkoutApp"
//        NetworkHelper.shared.performDataTask(endpointURLString: workoutEndpoint, httpMethod: "GET", httpData: nil) { (appError, data, httpResponse) in
//            if let appError = appError {
//                completionHandler(appError, nil )
//            }
//            guard let response = httpResponse,
//                (200...299).contains(response.statusCode) else {
//                    let statusCode = httpResponse?.statusCode ?? -999
//                    completionHandler(AppError.badStatusCode(String(statusCode)), nil)
//                    return
//            }
//
//            if let data = data {
//                do{
//                    let days = try JSONDecoder().decode(Days.self, from: data)
//                    _ = days.muscleGroup1
//                    completionHandler(appError, days)
//                } catch {
//                    completionHandler(AppError.decodingError(error), nil)
//                }
//            }
//        }
//    }
//}
