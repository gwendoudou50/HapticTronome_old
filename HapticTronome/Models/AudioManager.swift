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
    
    @Published var secondLapsed = 0
    var timer = Timer() // for time interval between each tic
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    
    @Published var isPlayingView: Bool = false
    
    func getIsPlaying() -> Bool {
        return self.isPlaying
    }
    
    func startPlayer(tic: String, tempo: Double) {
        
        guard let tic = Bundle.main.url(forResource: tic, withExtension: "wav") else {
            print("Ressource not found")
            return
        }
        
        
        do {
            // continue to play even app is in background
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
    
            player = try AVAudioPlayer(contentsOf: tic)
            
            self.isPlaying = true
            self.isPlayingView = true
            
            secondLapsed = 0
            player?.play()
            HapticManager().impact(style: .heavy)
            // play the player variable to each time interval
            timer = Timer.scheduledTimer(timeInterval: 60 / tempo, target: self, selector: #selector(play), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            
                
            
        } catch {
            print("Fail to initialize player", error)
        }
    }
    
    @objc func play() {
        self.player?.currentTime = 0
        self.player?.play()
        HapticManager().impact(style: .heavy)
        if secondLapsed < 3 && self.isPlayingView {
            secondLapsed += 1
        } else {
            secondLapsed = 0
        }
    }
    
    
    func stopPlayer() {
        guard let player = player else {
            print("Don't work")
            return 
        }

        if player.isPlaying {
            timer.invalidate()
            self.isPlaying = false
            self.isPlayingView = false
        }
    }
}

