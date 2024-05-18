//
//  MockDataDownloader.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import Foundation

final class MockDataDownloader: DataDownloaderProtocol {
    var mockData: Data?

    func fetchIsPrime(number: String) async throws -> WolframAlphaResult {
        do {
            return try JSONDecoder().decode(WolframAlphaResult.self, from: mockData ?? Data())
        } catch {
            throw error as? DataAPIError ?? .unknownError(error: error)
        }
    }
}
