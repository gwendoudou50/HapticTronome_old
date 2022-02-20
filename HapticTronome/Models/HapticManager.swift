//
//  HapticManager.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 19/02/2022.
//

import Foundation
import UIKit

class HapticManager: ObservableObject {
    
//    static let instance = HapticMan ager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

