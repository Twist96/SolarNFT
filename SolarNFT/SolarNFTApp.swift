//
//  SolarNFTApp.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

@main
struct SolarNFTApp: App {
    @State var appState: AppState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
