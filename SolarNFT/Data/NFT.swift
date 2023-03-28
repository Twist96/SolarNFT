//
//  NFT.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 28/03/2023.
//

import Foundation
import Fakery

struct NFT: Identifiable {
    var id: UUID = UUID()
    var name: String
    var creator: String
    var image: String
    var floorPrice: Double
    var totalVolume: Double
    var createdAt: Date
}

extension NFT {
    static var fakeDataList: [NFT] {
        let faker = Faker()
        return [
            NFT(name: "Ape Club", creator: faker.name.name(), image: "Ape", floorPrice: faker.number.randomDouble(min: 10, max: 100), totalVolume: 100, createdAt: faker.date.backward(days: 12)),
            NFT(name: "Luppy Club", creator: faker.name.name(), image: "Luppy", floorPrice: faker.number.randomDouble(min: 10, max: 100), totalVolume: 100, createdAt: faker.date.backward(days: 12)),
            NFT(name: "Bull X Club", creator: faker.name.name(), image: "Bull", floorPrice: faker.number.randomDouble(min: 10, max: 100), totalVolume: 100, createdAt: faker.date.backward(days: 12)),
            NFT(name: "AvatarZ", creator: faker.name.name(), image: "AvatarZ", floorPrice: faker.number.randomDouble(min: 10, max: 100), totalVolume: 100, createdAt: faker.date.backward(days: 12))
        ]
    }
}
