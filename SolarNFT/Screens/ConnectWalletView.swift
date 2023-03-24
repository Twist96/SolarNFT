//
//  ConnectWalletView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 24/03/2023.
//

import SwiftUI

struct ConnectWalletView: View {
    var body: some View {
        VStack(spacing: 0) {
            header

            Text("Choose the Wallet")
                .font(.audiowide(size: 30))
                .foregroundColor(.white)
                .padding(.top, 36)

            Text("Etherium")
        }
        .background(Color._background)
    }

    var header: some View {
        VStack {
            Button {

            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.bold)
                    .frame(width: 30, height: 30)
                    .background(
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 3))
                    )
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 30)
            Text("NFT World")
                .font(.audiowide(size: 30).width(.expanded))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .padding(.bottom, 34)
        .background(.cyan)
    }
}

struct ConnectWalletView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectWalletView()
    }
}
