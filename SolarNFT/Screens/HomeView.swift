//
//  HomeView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

struct HomeView: View {
    @State var startAnimation: Bool = false
    @State var imageHeight: CGFloat = 0
    let headerHeight: CGFloat = 200

    @State private var offset = CGPoint.zero
    @State private var visibleRatio = CGFloat.zero

    func handleOffset(_ scrollOffset: CGPoint, visibleHeaderRatio: CGFloat) {
        self.offset = scrollOffset
    }

    var multiplierEffect: Double {
        return 1.0 - offset.y / 200.0
    }

    var body: some View {
        NavigationStack {
            ZStack {
                background
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true)) {
                            startAnimation = true
                        }
                    }
                OffsetObservingScrollView(axes: .vertical, showsIndicators: false, offset: $offset) {
                    VStack {
                        trending
                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(150), spacing: 30), count: 2), spacing: 20) {
                            ForEach(0 ..< 50) { item in
                                NavigationLink {
                                    NFTDetailsView()
                                } label: {
                                    NFTCard()
                                }

                            }
                        }
                        .padding(.bottom, 140)

                    }
                }
                .overlay(alignment: .top) {
                    header
                }

            }
        }
    }

    var header: some View {
        HStack {
            Text("Explore\nCollection")
                .font(.audiowide(size: 30))
                .foregroundColor(._gray)
                .background {
                    RadialGradient(colors: [.gray, .clear], center: .center, startRadius: 1, endRadius: 200)
                        .frame(width: 250, height: 250)
                        .blur(radius: 30)
                        .opacity(0.5)
                        .offset(x: -50)
                }

            Spacer()

            Image.magnifyingGlass
                .frame(width: 46, height: 46)
                .background {
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 3))
                        .foregroundColor(._redFade)
                }
        }
        .padding(.horizontal, 30)
        .padding(.top, 100 * multiplierEffect)
        .onChange(of: multiplierEffect) { newValue in
            print("offset: ", offset.y)
            print("multiplierEffect: ", newValue)
        }
    }

    var trending: some View {
        HStack {
            Text("Trending")
                .font(.audiowide(size: 26))
                .foregroundColor(.white)

            Spacer()

            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 8.12, height: 14.23)
                .padding(EdgeInsets(top: 8.25, leading: 11.25, bottom: 7.52, trailing: 10.63))
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background {
                    LinearGradient(colors: [._gray2.opacity(0.1), .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .clipShape(Circle())
                }
        }
        .padding(.leading, 24)
        .padding(.trailing, 36)
        .padding(.top, 200)
    }

    var background: some View {
        ZStack {
            Color._background
                .ignoresSafeArea()
            ZStack {
                CustomShape2()
                    .fill(Color.accentColor)
                    .offset(y: 160)
                    .offset(x: startAnimation ? 0 : 120, y: startAnimation ? 0 : 189)
                CustomShape1()
                    .fill(Color._red)
                    .offset(x: startAnimation ? 0 : -90, y: startAnimation ? 0 : -250)
            }
            .blur(radius: 100)

            Color.clear
                .background(.ultraThinMaterial)
                .opacity(0.3)

            LinearGradient(colors: [.clear, .clear, ._background], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
