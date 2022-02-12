//
//  HapticTronome.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 11/02/2022.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var progress: CGFloat = 0
    @Published var angle: Double = 0
    
    func onChanged(value: DragGesture.Value) {
        let translation = value.location
        
        let vector = CGVector(dx: translation.x, dy: translation.y)
        
        // - 10 is circle radius since circle size is 20
        let radians = atan2(vector.dy - 10, vector.dx - 10)
        
        var angle = radians * 180 / .pi
        
        if angle < 0 {
            angle = 360 + angle
        }
        
        // limiting angle from 0 to 240
        if angle <= 240 {
            self.angle = Double(angle)
        }
    }
}
