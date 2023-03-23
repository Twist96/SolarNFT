//
//  NavigationBar.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

struct NavigationBar: View {
    var menuList = NavBarMenu.allCases
    @AppStorage("activeMenu") var activeMenu: NavBarMenu = .home
    @State var circleOffset: Double = .zero

    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0) {
                GeometryReader { proxy in
                    let buttonWidth = proxy.size.width / Double(menuList.count)
                    HStack(spacing: 0) {
                        ForEach(Array(menuList.enumerated()), id: \.offset) { index, menu in
                            icon(menu)
                                .frame(width: 37, height: 37)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    activeMenu = menu
                                    print(menu.rawValue)
                                    withAnimation(.easeInOut) {
                                        circleOffset = Double(activeMenu.index) * buttonWidth
                                    }
                                }
                        }
                    }
                    .background {
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 65, height: 65)
                            .offset(x: 2.5)
                            .offset(x: circleOffset)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.top, 11)
            }
            .padding(EdgeInsets(top: 11, leading: 28, bottom: 36, trailing: 11))
            .frame(height: 100)
            .background(Color._background)
            .cornerRadius(100)

        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    func icon(_ icon: NavBarMenu) -> some View {
        switch icon {
        case .home:
            Image.home
        case .search:
            Image.search
        case .plus:
            Image.plus
        case .discovery:
            Image.discovery
        case .profile:
            Image.profile
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
            .background(.background)
    }
}

enum NavBarMenu: String, Identifiable, CaseIterable {
    case home
    case search
    case plus
    case discovery
    case profile

    var id: String {
        self.rawValue
    }

    var index: Int {
        switch self {
        case .home:
            return 0
        case .search:
            return 1
        case .plus:
            return 2
        case .discovery:
            return 3
        case .profile:
            return 4
        }
    }
}
