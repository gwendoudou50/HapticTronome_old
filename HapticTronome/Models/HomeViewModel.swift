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
    
    // it used when the button is turning
    func onChanged(value: DragGesture.Value) {
        
        // calculating radians...
        let translation = value.location
        let vector = CGVector(dx: translation.x, dy: translation.y)
        
        // -10 to eliminate drag gesture...
        let radians = atan2(vector.dy - 10, vector.dx - 10)
        
        // converting to angle...
        var angle = radians * 180 / .pi
        
        if angle < 0 {
            angle = 360 + angle
        }
        
        // limiting angle from 0 to 240
        if angle <= 240 {
            let progress = angle / 240
            self.progress = progress
            self.angle = Double(angle)
        }
    }
}
