//
//  CustomTabBar.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 24/03/2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedWallet: Chain
    var wallets = Chain.allCases
    private let buttonWidth = 98.0

    var body: some View {

        VStack {
            HStack {
                ForEach(wallets) { wallet in
                    Text(wallet.rawValue)
                        .font(.exo2(size: 20))
                        .foregroundColor(.white)
                        .frame(width: buttonWidth, height: 39, alignment: .top)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                selectedWallet = wallet
                            }
                        }
                }
            }
            ZStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white.opacity(0.5))
                Rectangle()
                    .frame(height: 1)
                    .frame(width: buttonWidth)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: Double(selectedWallet.index) * buttonWidth)
            }
        }
        .frame(width: buttonWidth * Double(wallets.count))
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedWallet: .constant(.etherium))
            .background(.black)
    }
}


enum Chain: String, Identifiable, CaseIterable {
    case etherium = "Etherium"
    case flow = "Flow"
    case solana = "Solana"

    var id: String {
        self.rawValue
    }

    var index: Int {
        switch self {
        case .etherium:
            return 0
        case .flow:
            return 1
        case .solana:
            return 2
        }
    }
}
