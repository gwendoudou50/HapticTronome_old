//
//  HapticTronomeApp.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 07/02/2022.
//

import Foundation
import SwiftUI
import CoreHaptics

@main
struct HapticTronomeApp: App {
    @StateObject var audioManager = AudioManager()
    
//    init() {
//        var supportsHaptics: Bool = false
//
//        // Check if the device supports haptics
//        let hapticCapability = CHHapticEngine.capabilitiesForHardware()
//        supportsHaptics = hapticCapability.supportsHaptics
//
//
//    }
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
