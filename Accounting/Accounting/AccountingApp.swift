//
//  AccountingApp.swift
//  Accounting
//
//  Created by Oleksandr Isaiev on 17.05.2024.
//

import SwiftUI

@main
struct AccountingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: AppStateViewModel(service: DataDownloader()))
        }
    }
}
