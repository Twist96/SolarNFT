//
//  MotionManager.swift
//  SolarNFT
//
//  Created by Matthew Chukwuemeka on 28/03/2023.
//

import CoreMotion

class MotionManager: ObservableObject {
    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0
    @Published var rotation: Double = 0.0

    var manager: CMMotionManager

    init() {
        manager = CMMotionManager()
        manager.deviceMotionUpdateInterval = 1/60
        manager.startDeviceMotionUpdates(to: .main) { motionData, error in
            guard error == nil else { return }

            if let motionData = motionData {
                self.pitch = motionData.attitude.pitch
                self.roll = motionData.attitude.roll
                self.rotation = motionData.rotationRate.x
            }
        }
    }
}
