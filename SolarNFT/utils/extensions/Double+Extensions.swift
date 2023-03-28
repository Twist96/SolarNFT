//
//  Double+Extensions.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 28/03/2023.
//

import Foundation

extension Double {
    func roundUpString(_ places: Int) -> String {
        String(format: "%.\(places)f", self)
    }
}
