//
//  Font+Extensions.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 23/03/2023.
//

import SwiftUI

extension Font {
    static func audiowide(size: CGFloat) -> Font {
        .custom("Audiowide-Regular", size: size)
    }

    static func roboto(size: CGFloat) -> Font {
        .custom("Roboto-Regular.ttf", size: size)
    }

    static func robotoBold(size: CGFloat) -> Font {
        .custom("Roboto-Bold.ttf", size: size)
    }

    static func robotoMedium(size: CGFloat) -> Font {
        .custom("Roboto-Medium.ttf", size: size)
    }

    static func exo2(size: CGFloat) -> Font {
        .custom("Exo2-Regular.ttf", size: size)
    }
}

