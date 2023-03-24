//
//  HomeView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

struct HomeView: View {
    @State var startAnimation: Bool = false

    var body: some View {
        ZStack {
            background
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true)) {
                        startAnimation = true
                    }
            }

            VStack {
                header

                ScrollView(showsIndicators: false) {
                    VStack {
                        trending

                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(150), spacing: 30), count: 2), spacing: 20) {
                            ForEach(0 ..< 5) { item in
                                NFTCard()
                            }
                        }
                        .padding(.bottom, 140)

                    }
                }
                .padding(.horizontal, 26)
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
        .padding(.top, 100)
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
    }

    var background: some View {
        ZStack {
            Color._background
                .ignoresSafeArea()
            ZStack {
                MyCustomShape2()
                    .fill(Color.accentColor)
                    .offset(y: 160)
                    .offset(x: startAnimation ? 0 : 120, y: startAnimation ? 0 : 189)
                MyCustomShape1()
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


struct MyCustomShape1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.83333*width, y: 0.55498*height))
        path.addCurve(to: CGPoint(x: 0.7357*width, y: 0.3826*height), control1: CGPoint(x: 0.83333*width, y: 0.49033*height), control2: CGPoint(x: 0.79822*width, y: 0.42832*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.3112*height), control1: CGPoint(x: 0.67319*width, y: 0.33689*height), control2: CGPoint(x: 0.58841*width, y: 0.3112*height))
        path.addCurve(to: CGPoint(x: 0.2643*width, y: 0.3826*height), control1: CGPoint(x: 0.41159*width, y: 0.3112*height), control2: CGPoint(x: 0.32681*width, y: 0.33689*height))
        path.addCurve(to: CGPoint(x: 0.16667*width, y: 0.55498*height), control1: CGPoint(x: 0.20179*width, y: 0.42832*height), control2: CGPoint(x: 0.16667*width, y: 0.49033*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.66909*height), control1: CGPoint(x: 0.16667*width, y: 0.55498*height), control2: CGPoint(x: 0.60641*width, y: 0.59232*height))
        path.addCurve(to: CGPoint(x: 0.83333*width, y: 0.55498*height), control1: CGPoint(x: 0.39359*width, y: 0.74585*height), control2: CGPoint(x: 0.83333*width, y: 0.55498*height))
        path.closeSubpath()
        return path
    }
}

struct MyCustomShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.16667*width, y: 0.36005*height))
        path.addCurve(to: CGPoint(x: 0.2643*width, y: 0.55882*height), control1: CGPoint(x: 0.16667*width, y: 0.4346*height), control2: CGPoint(x: 0.20179*width, y: 0.5061*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.64115*height), control1: CGPoint(x: 0.32681*width, y: 0.61153*height), control2: CGPoint(x: 0.41159*width, y: 0.64115*height))
        path.addCurve(to: CGPoint(x: 0.7357*width, y: 0.55882*height), control1: CGPoint(x: 0.58841*width, y: 0.64115*height), control2: CGPoint(x: 0.67319*width, y: 0.61153*height))
        path.addCurve(to: CGPoint(x: 0.83333*width, y: 0.36005*height), control1: CGPoint(x: 0.79822*width, y: 0.5061*height), control2: CGPoint(x: 0.83333*width, y: 0.4346*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.36005*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.36005*height))
        path.closeSubpath()
        return path
    }
}
