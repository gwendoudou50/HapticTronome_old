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
    
    func onDrag(value: DragGesture.Value) {
        
        // calculating radians...
        
        let vector  = CGVector(dx: value.location.x, dy: value.location.y)
        
        // since atan2 will give from -180 to 180
        // eliminating drag gesture size
        // size = 55 => Radius = 27.5...
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        
        // converting to angle...
        
        var angle = radians * 180 / .pi
        
        // simple technique for 0 to 360
        
        // eg = 360 - 176 = 184...
        if angle < 0 {
            angle = 360 + angle
        }
        
        withAnimation(Animation.linear(duration: 0.15)) {
            
            // progress...
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
            
        }
        
    }
}
