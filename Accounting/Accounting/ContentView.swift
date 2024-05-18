//
//  ContentView.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel: AppStateViewModel

    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: CounterView(viewModel: viewModel)) {
                    HStack {
                        Text("Counter demo")
                        Spacer()
                        Image(systemName: "\(viewModel.count).circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }

                NavigationLink(destination: FavoritePrimesView(viewModel: viewModel)) {
                    Text("Favorite primes")
                }
            }
            .listStyle(.plain)
            .navigationTitle("State management")
        }
    }
}

#Preview {
    ContentView(viewModel: AppStateViewModel(service: MockDataDownloader()))
}
