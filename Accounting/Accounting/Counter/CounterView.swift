//
//  CounterView.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import SwiftUI

struct CounterView: View {

    private var ordinal: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: viewModel.count) ?? ""
    }
    
    @ObservedObject var viewModel: AppStateViewModel
    @State var isPrimeModalShown = false

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button("-") {
                    viewModel.count -= 1
                }
                Text("\(viewModel.count)")
                Button("+") {
                    viewModel.count += 1
                }
            }

            Button("Is this prime?") {
                isPrimeModalShown.toggle()
            }

            Button("What is the \(ordinal) prime?") {
                Task { await viewModel.nthPrime("\(ordinal.count)") }
            }
        }
        .font(.title)
        .navigationTitle("Counter demo")
        .sheet(isPresented: $isPrimeModalShown, content: {
            IsPrimeModalView(viewModel: viewModel)
        })
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("The \(ordinal) prime is \(viewModel.alertMessage ?? "")"), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    NavigationStack {
        CounterView(viewModel:AppStateViewModel(service: MockDataDownloader()))
    }
}
