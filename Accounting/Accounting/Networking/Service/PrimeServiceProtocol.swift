//
//  PrimeServiceProtocol.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import Foundation

protocol DataDownloaderProtocol {
    func fetchIsPrime(number: String) async throws -> WolframAlphaResult
}

actor DataDownloader: DataDownloaderProtocol, HTTPDataDownloader {
    func fetchIsPrime(number: String) async throws -> WolframAlphaResult {

        guard let endpoint = checkIsFavorite(query: number) else {
            throw DataAPIError.requestFailed(description: "Invalid Endpoint")
        }

        let result = try await fetchData(as: WolframAlphaResult.self, endpoint: endpoint)

        return result
    }

    // MARK: - Helpers -
    private var baseUrlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.wolframalpha.com"
        components.path = "/v2/query"
        return components
    }

    private func checkIsFavorite(query: String) -> String? {
        var components = baseUrlComponents
        components.queryItems = [
            .init(name: "input", value: query),
            .init(name: "format", value: "plaintext"),
            .init(name: "output", value: "JSON"),
            .init(name: "appid", value: "7TJ2AY-Q4EPYV7LW5")
        ]
        return components.url?.absoluteString
    }
}
