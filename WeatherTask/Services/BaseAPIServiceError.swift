//
//  BaseAPIServiceError.swift
//  WeatherTask
//
//  Created by Omima Ibrahim on 11/17/20.
//

import Foundation

enum BaseAPIServiceError: LocalizedError {
    case parsingError
    case serverError(message: String)
    
    var errorDescription: String? {
        switch self {
        case .parsingError: return "JSON Parsing Failure"
        case .serverError(let message): return "\(message)"
        }
    }
}
