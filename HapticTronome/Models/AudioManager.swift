//
//  audioManager.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 12/02/2022.
//

import Foundation
import AVKit
import SwiftUI

final class AudioManager: ObservableObject {
    
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    
    var timer = Timer()
    
    func startPlayer(tic: String) {
        
        guard let tic = Bundle.main.url(forResource: tic, withExtension: "wav") else {
            print("Ressource not found")
            return
        }
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
    
            player = try AVAudioPlayer(contentsOf: tic)
            
            isPlaying = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.player?.currentTime = 0
                self.player?.play()
            }
            
        } catch {
            print("Fail to initialize player", error)
        }
    }
    
    func stop() {
        guard let player = player else {
            print("Don't work")
            return
        }

        if player.isPlaying {
            print("is playing")
            timer.invalidate()
            isPlaying = false
        }
    }
}
