//
//  NFTDetailsView.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 24/03/2023.
//

import SwiftUI

struct NFTDetailsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color._background
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()

            header

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

                }
            }
            .padding(.top, 160)
        }
        .navigationBarBackButtonHidden()
    }

    var header: some View {
        VStack(spacing: 0) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color._gray2.opacity(0.5))
                    .clipShape(Circle())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 40)
                    .padding(.trailing, 24)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Luppy Club")
                    .font(.exo2(size: 30))

                HStack(alignment: .bottom) {
                    Image.avatar
                        .resizable()
                        .frame(width: 26, height: 26)
                        .clipShape(Circle())

                    Text("Alex S.")
                }
                .padding(.leading, 10)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 26)

            Spacer()
        }
    }

    var imageHeader: some View {
        HStack(spacing: 8) {
            Image(systemName: "viewfinder")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(2)
                .background(.black)
                .clipShape(Circle())

            Spacer()

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

struct NFTDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NFTDetailsView()
    }
}
