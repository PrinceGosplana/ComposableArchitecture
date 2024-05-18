//
//  DataAPIError.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import Foundation

enum DataAPIError: Error {
    case invalidURL
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)

    var customDescription: String {
        switch self {
        case .invalidURL: "Invalid URL"
        case .invalidData: "Invalid data"
        case .jsonParsingFailure: "Failed to parse JSON"
        case .requestFailed(let description): "Request failed \(description)"
        case .invalidStatusCode(let statusCode): "Invalid status code \(statusCode)"
        case .unknownError(let error): "An unknown error occurred \(error.localizedDescription)"
        }
    }
}
