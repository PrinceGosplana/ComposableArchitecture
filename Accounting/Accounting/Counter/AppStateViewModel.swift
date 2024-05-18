//
//  AppStateViewModel.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import Foundation

final class AppStateViewModel: ObservableObject {
    @Published var count = 0
    var alertMessage: String?
    @Published var favoritePrimes: [Int] = []
    @Published var showAlert = false
    private let service: DataDownloaderProtocol

    init(service: DataDownloaderProtocol) {
        self.service = service
    }

    func isPrime() -> Bool {
        if count <= 1 { return false }
        if count <= 3 { return true }
        for i in 2...Int(sqrt(Float(count))) {
            if count % i == 0 { return false }
        }
        return true
    }

    func isContain(number: Int) -> Bool {
        favoritePrimes.contains(number)
    }

    func removeFromFavorite(_ number: Int) {
        favoritePrimes.removeAll(where: { $0 == number})
    }

    func addToFavorite(_ number: Int) {
        if !favoritePrimes.contains(number) {
            favoritePrimes.append(number)
        }
    }

    func nthPrime(_ n: String) async {
        do {
            let result = try await service.fetchIsPrime(number: n)
                .queryresult
                .pods
                .first(where: { $0.primary == .some(true)})?
                .subpods
                .first?
                .plaintext

            await MainActor.run {
                alertMessage = result
                showAlert.toggle()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
