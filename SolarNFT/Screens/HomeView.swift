//
//  HomeView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

struct HomeView: View {
    @State var nfts = NFT.fakeDataList + NFT.fakeDataList
    @State var startAnimation: Bool = false
    @State private var offset = CGPoint.zero

    var multiplierEffect: Double {
        let value = 1.0 - offset.y / 200.0
        return value < 0.25 ? 0.25 : value
    }

    var headerFont: CGFloat {
        let font = 30 * (multiplierEffect * 1.5)
        if font < 24 {
            return 24
        } else if font > 50 {
            return 50
        }
        return font
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
                            ForEach(nfts) { item in
                                NavigationLink {
                                    NFTDetailsView(nft: item)
                                } label: {
                                    NFTCard(nft: item)
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
        ZStack(alignment: .bottom) {

            LinearGradient(colors: [.black.opacity(0.8), .clear], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Color.black
                    .ignoresSafeArea()
                    .opacity(headerFont < 28 ? 0.5 : 0)

                Divider()
                    .opacity(headerFont < 28 ? 1 : 0)
            }

            HStack {
                Text(multiplierEffect > 0.6 ? "Explore\nCollection" : "ExploreCollection")
                    .font(.audiowide(size: headerFont))
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
                    .scaleEffect(headerFont < 28 ? 0.5 : 1)
            }
            .padding(.horizontal, 30)

        }
        .frame(height: 180 * multiplierEffect, alignment: .bottom)
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
