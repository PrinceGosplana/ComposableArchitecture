//
//  IsPrimeModalView.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import SwiftUI

struct IsPrimeModalView: View {
    
    @ObservedObject var viewModel: AppStateViewModel

    var body: some View {
        if viewModel.isPrime() {
            Text("\(viewModel.count) is prime 🎉")
            if viewModel.isContain(number: viewModel.count) {

                Button("Remove from favorite primes") {
                    viewModel.removeFromFavorite(viewModel.count)
                }
            } else {
                Button("Save to favorite primes") {
                    viewModel.addToFavorite(viewModel.count)
                }
            }
        } else {
            Text("\(self.viewModel.count) is not prime 😞")
        }


    }
}

#Preview {
    IsPrimeModalView(viewModel: AppStateViewModel(service: MockDataDownloader()))
}
