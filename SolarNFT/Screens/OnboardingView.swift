//
//  OnboardingView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var motionManager = MotionManager()

    var body: some View {
        ZStack {
            Image.onboardingBackground
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .background(.black)
                .overlay {
                    Image.onboardingBackground
                        .mask {
                            LinearGradient(colors: [.clear, .white, .clear, .white, .clear, .white, .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(motionManager.roll * 8 + 1), y: abs(motionManager.roll * 8 + 1)))
                        }
                        .blendMode(.overlay)
                }
                .overlay {
                    ZStack {
                        LinearGradient(colors: [.clear, .white.opacity(0.2), .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(motionManager.roll * 5 + 1), y: abs(motionManager.roll * 5 + 1)))
                        LinearGradient(colors: [.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .cornerRadius(50)
                            .blendMode(.softLight)
                            .opacity(0.5)
                    }
                }


            VStack {
                Spacer()
                Text("Worlds Largest Digital Market Place (NFT)")
                    .multilineTextAlignment(.center)
                    .font(.audiowide(size: 36))
                    .foregroundColor(.white)
                    .padding(.horizontal, 36)
                    .padding(.bottom, 84)

                Button {
                    withAnimation {
                        appState.loginState = .loggedIn
                    }
                } label: {
                    Text("Let Explore.")
                        .font(.robotoMedium(size: 18))
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(width: 267)
                        .background(
                            RoundedRectangle(cornerRadius: 94)
                                .stroke(style: StrokeStyle(lineWidth: 1.5))
                                .foregroundColor(.white)
                        )
                }
            }
            .padding(.bottom, 50)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(AppState())
    }
}
