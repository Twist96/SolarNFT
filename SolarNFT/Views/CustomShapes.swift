//
//  CustomShapes.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 27/03/2023.
//

import SwiftUI

struct CustomShape1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.83333*width, y: 0.55498*height))
        path.addCurve(to: CGPoint(x: 0.7357*width, y: 0.3826*height), control1: CGPoint(x: 0.83333*width, y: 0.49033*height), control2: CGPoint(x: 0.79822*width, y: 0.42832*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.3112*height), control1: CGPoint(x: 0.67319*width, y: 0.33689*height), control2: CGPoint(x: 0.58841*width, y: 0.3112*height))
        path.addCurve(to: CGPoint(x: 0.2643*width, y: 0.3826*height), control1: CGPoint(x: 0.41159*width, y: 0.3112*height), control2: CGPoint(x: 0.32681*width, y: 0.33689*height))
        path.addCurve(to: CGPoint(x: 0.16667*width, y: 0.55498*height), control1: CGPoint(x: 0.20179*width, y: 0.42832*height), control2: CGPoint(x: 0.16667*width, y: 0.49033*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.66909*height), control1: CGPoint(x: 0.16667*width, y: 0.55498*height), control2: CGPoint(x: 0.60641*width, y: 0.59232*height))
        path.addCurve(to: CGPoint(x: 0.83333*width, y: 0.55498*height), control1: CGPoint(x: 0.39359*width, y: 0.74585*height), control2: CGPoint(x: 0.83333*width, y: 0.55498*height))
        path.closeSubpath()
        return path
    }
}

struct CustomShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.16667*width, y: 0.36005*height))
        path.addCurve(to: CGPoint(x: 0.2643*width, y: 0.55882*height), control1: CGPoint(x: 0.16667*width, y: 0.4346*height), control2: CGPoint(x: 0.20179*width, y: 0.5061*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.64115*height), control1: CGPoint(x: 0.32681*width, y: 0.61153*height), control2: CGPoint(x: 0.41159*width, y: 0.64115*height))
        path.addCurve(to: CGPoint(x: 0.7357*width, y: 0.55882*height), control1: CGPoint(x: 0.58841*width, y: 0.64115*height), control2: CGPoint(x: 0.67319*width, y: 0.61153*height))
        path.addCurve(to: CGPoint(x: 0.83333*width, y: 0.36005*height), control1: CGPoint(x: 0.79822*width, y: 0.5061*height), control2: CGPoint(x: 0.83333*width, y: 0.4346*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.36005*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.36005*height))
        path.closeSubpath()
        return path
    }
}

struct CustomShapes: View {
    var body: some View {
        VStack {
            CustomShape1()
            CustomShape2()
        }
    }
}

struct CustomShapes_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapes()
    }
}
