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
    
//    @StateObject var homeData = HomeViewModel(hapticTronome: HapticTronome.data)
//    @Published var homeData: HomeViewModel = HomeViewModel.init(hapticTronome: .data)
//    @State var tempo = HomeViewModel.getTempo(.init(hapticTronome: .data))
    
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    
    var timer = Timer()
    
    func startPlayer(tic: String, tempo: Double) {
        
        guard let tic = Bundle.main.url(forResource: tic, withExtension: "wav") else {
            print("Ressource not found")
            return
        }
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
    
            player = try AVAudioPlayer(contentsOf: tic)
            
            isPlaying = true
            timer = Timer.scheduledTimer(timeInterval: 60 / tempo, target: self, selector: #selector(play), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: .common)
            
        } catch {
            print("Fail to initialize player", error)
        }
    }
    
    @objc func play() {
        self.player?.currentTime = 0
        self.player?.play()
    }
    
    func stop() {
        guard let player = player else {
            print("Don't work")
            return
        }

        if player.isPlaying {
            timer.invalidate()
            isPlaying = false
        }
    }
}

