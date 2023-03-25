//
//  ContentView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("activeMenu") var activeMenu: NavBarMenu = .home
    @EnvironmentObject var appState: AppState

    @State var isHidden = false

    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack {
            TabView(selection: $activeMenu) {
                HomeView()
                    .tag(NavBarMenu.home)

                Text("Search")
                    .tag(NavBarMenu.search)

                Text("Create NFT")
                    .tag(NavBarMenu.plus)

                Text("Discovery")
                    .tag(NavBarMenu.discovery)

                ConnectWalletView()
                    .tag(NavBarMenu.profile)
            }
            NavigationBar(activeMenu: $activeMenu)
                .offset(y: appState.isNavBarHidden ? 150 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppState())
    }
}
