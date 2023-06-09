//
//  NFTCard.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

struct NFTCard: View {
    var nft: NFT

    var body: some View {
        ZStack {
            Image(nft.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200)

            VStack(alignment: .leading) {
                Text(nft.createdAt, style: .relative)
                    .font(.roboto(size: 12))
                    .padding(EdgeInsets(top: 3, leading: 5, bottom: 4, trailing: 7))
                    .background(Color._gray2)
                    .cornerRadius(50)
                    .padding(.top, 7)
                    .padding(.leading, 6)

                Spacer()

                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Text(nft.image)
                        Image.verificationBadge
                    }

                    HStack {
                        VStack(alignment: .leading) {
                            Text("FLOOR")
                                .font(.robotoMedium(size: 8))
                                .foregroundColor(._gray)

                            Text("\(nft.floorPrice.roundUpString(1)) ETH")
                        }

                        Spacer()

                        VStack(alignment: .leading) {
                            Text("TOTAL VOLUME")
                                .font(.robotoMedium(size: 8))
                                .foregroundColor(._gray)

                            Text("\(nft.totalVolume.roundUpString(1)) ETH")
                        }
                    }
                }
                .font(.robotoMedium(size: 12))
                .foregroundColor(.black)
                .padding(6)
                .background(.white.opacity(0.9))
                .cornerRadius(10)
                .padding(.horizontal, 3)
                .padding(.bottom, 14)

            }
        }
        .frame(width: 150, height: 200)
        .cornerRadius(20)
    }
}

struct NFTCard_Previews: PreviewProvider {
    static var previews: some View {
        NFTCard(nft: NFT.fakeDataList[0])
    }
}
