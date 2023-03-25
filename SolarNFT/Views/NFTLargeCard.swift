//
//  NFTLargeCard.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 25/03/2023.
//

import SwiftUI

struct NFTLargeCard: View {
    @State var isLarge = false
    var topOffset = 160

    var body: some View {
        ZStack {
            Image.bear
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(40)
                .ignoresSafeArea()

            VStack {

                imageHeader

                Spacer()

                imageFooter
                    .offset(y: isLarge ? 200 : 0)
                    .blur(radius: isLarge ? 50 : 0)
                    .opacity(isLarge ? 0 : 1)
            }
        }
        .padding(.top, isLarge ? 0 : 160)
    }

    var imageHeader: some View {
        HStack(spacing: 8) {
            Image(systemName: "viewfinder")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(2)
                .background(.black)
                .clipShape(Circle())
                .scaleEffect(isLarge ? 1.5 : 1)
                .offset(x: isLarge ? 32 : 0, y: isLarge ? -16 : 0)
                .shadow(color: .black.opacity(isLarge ? 0.3 : 0), radius: 5, x: 5, y: 5)
                .onTapGesture {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                        isLarge.toggle()
                    }
                }

            Spacer()

            Group {
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .padding(2)
                    .background(.black)
                    .clipShape(Circle())

                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color._red)
                    Text("88")
                        .foregroundColor(.white)
                }
                .padding(6)
                .background(.black)
                .cornerRadius(100)

                Image(systemName: "ellipsis")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .padding(2)
                    .background(.black)
                    .clipShape(Circle())
            }
            .offset(x: isLarge ? 180 : 0)
            .blur(radius: isLarge ? 50 : 0)
            .opacity(isLarge ? 0 : 1)
        }
        .padding(.top, 21)
        .padding(.horizontal, 24)
    }

    var imageFooter: some View {
        Grid(alignment: .leading, horizontalSpacing: 22, verticalSpacing: 8) {
            GridRow {
                Text("Ending in")
                Text("Highest Bid")
            }
            .font(.roboto(size: 14))
            .foregroundColor(.white.opacity(0.4))

            GridRow {
                Text("8h    10m   21s")
                Text("8h    10m   21s")
            }
            .font(.robotoBold(size: 16))

            GridRow {

                Button {

                } label: {
                    Text("Purchase")
                        .font(.roboto(size: 16))
                        .frame(width: 123, height: 30)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke()
                        )
                }

                Button {

                } label: {
                    Text("Place a Bid")
                        .font(.roboto(size: 16))
                        .frame(width: 123, height: 30)
                        .background(
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundColor(.purple)
                        )
                }

            }
            .padding(.top, 6)

        }
        .foregroundColor(.white)
        .padding(EdgeInsets(top: 17, leading: 14, bottom: 14, trailing: 14))
        .padding(.trailing, 34)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.bottom, 36)
        .overlay(alignment: .topTrailing) {
            Image.avatar
                .clipShape(Circle())
                .padding(.top, 7)
                .padding(.trailing, 7)
        }
    }
}

struct NFTLargeCard_Previews: PreviewProvider {
    static var previews: some View {
        NFTLargeCard()
    }
}
