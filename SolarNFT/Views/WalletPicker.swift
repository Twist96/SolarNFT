//
//  WalletItem.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 24/03/2023.
//

import SwiftUI

struct WalletPicker: View {
    private let walletList = Wallet.allCases
    @State private var selectedWallet: Wallet = .metaMask

    var body: some View {
        VStack(spacing: 18) {
            ForEach(walletList) { wallet in
                button(wallet: wallet, isActive: wallet == selectedWallet)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selectedWallet = wallet
                        }
                    }
            }
        }
    }

    @ViewBuilder
    func button(wallet: Wallet, isActive: Bool) -> some View {
        VStack {
            HStack(spacing: 30) {
                VStack {
                    switch wallet {
                    case .metaMask:
                        Image.metaMask
                    case .coinBase:
                        Image.coinBase
                    case .walletConnect:
                        Image.walletConnect
                    case .beacon:
                        Image.beacon
                    }
                }
                .frame(width: 45, height: 45)
                Text(wallet.rawValue)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                        .foregroundColor(.gray)

                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1.5)
                        .foregroundStyle(.linearGradient(colors: [._red, ._cyan, ._cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .mask(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .frame(maxWidth: isActive ? .infinity : 0)
                        }
                        .opacity(isActive ? 1 : 0)

                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color._gray2.opacity(0.5))
                        .padding(5)
                        .opacity(isActive ? 1 : 0)
                }
            }
        }
    }
}

struct WalletPicker_Previews: PreviewProvider {
    static var previews: some View {
        WalletPicker()
            .padding()
    }
}

enum Wallet: String, CaseIterable, Identifiable {
    case metaMask = "MetaMask"
    case coinBase =  "CoinBase"
    case walletConnect = "WalletConnect"
    case beacon = "Beacon"

    var id: String {
        self.rawValue
    }
}
