//
//  OnboardingView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            Image.onboardingBackground
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .background(.black)
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(.white)
                        .ignoresSafeArea()
                        .blendMode(.overlay)
                        .ignoresSafeArea()
                        .opacity(0.5)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(.white)
                        .opacity(0.15)
                        .ignoresSafeArea()
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
                    print("login in")
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
    }
}
