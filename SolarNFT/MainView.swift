//
//  MainView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 28/03/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        switch appState.loginState {
        case .onBoarding:
            OnboardingView()
        case .loggedIn:
            ContentView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppState())
    }
}

enum LoginStatus {
    case onBoarding
    case loggedIn
}
