//
//  AppError.swift
//  WorkoutApp
//
//  Created by Yaz Burrell on 1/2/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

public enum AppError: Error {
    case badURL(String)
    case networkError(Error)
    case noResponse
    case decodingError(Error)
    case badStatusCode(String)
    case badMimeType(String)
    
    public func errorMessage() -> String {
        switch self {
        case .badURL(let message):
            return "badURL: \(message)"
        case .networkError(let error):
            return "Network error type: \(error)"
        case .noResponse:
            return "No network response"
        case .decodingError(let error):
            return "Decoding error type: \(error)"
        case .badStatusCode(let message):
            return "Bad status code: \(message)"
        case .badMimeType(let message):
            return "badMimbeType: \(message)"
        
        }
    }
}








