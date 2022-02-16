//
//  HapticTronome.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 11/02/2022.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    private(set) var hapticTronome: HapticTronome
    
    init(hapticTronome: HapticTronome) {
        self.hapticTronome = hapticTronome
    }
    
    @Published var progress: CGFloat = 0
    @Published var angle: Double = 0
    @Published var tempo: Int = 40
    
    var bpmMin: CGFloat = CGFloat(HapticTronome.data.bpmMin)
    var bpmMax: CGFloat = CGFloat(HapticTronome.data.bpmMax)
    
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
            withAnimation(Animation.linear(duration: 0.1)) {
                let progress = angle / 240
                self.progress = progress
                self.angle = Double(angle)
                self.tempo = Int((bpmMin + self.progress * (bpmMax - bpmMin))) // converting progress in bpm
            }
        }
    }
}

struct HapticTronome {
    let id = UUID()
    let tic: String
    let timeSignature: TimeSignature
    let bpmMin: Int
    let bpmMax: Int
    
    struct TimeSignature {
        var numerator: Int
        var denominator: Int
    }
    
    static let data = HapticTronome(tic: "hit-hat", timeSignature: .init(numerator: 4, denominator: 4), bpmMin: 40, bpmMax: 400)
}
