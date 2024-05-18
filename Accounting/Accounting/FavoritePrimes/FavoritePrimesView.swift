//
//  FavoritePrimesView.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import SwiftUI

struct FavoritePrimesView: View {

    @ObservedObject var viewModel: AppStateViewModel

    var body: some View {
        List {
            ForEach(viewModel.favoritePrimes, id: \.self) { prime in
                Text("\(prime)")
                    .font(.title2)
            }
            .onDelete(perform: { indexSet in
                for index in indexSet {
                    viewModel.favoritePrimes.remove(at: index)
                }
            })
        }
        .navigationTitle("Favorite Primes")
    }
}

#Preview {
    NavigationStack {
        FavoritePrimesView(viewModel: AppStateViewModel(service: MockDataDownloader()))
    }
}
