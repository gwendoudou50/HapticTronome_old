//
//  audioManager.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 12/02/2022.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
    
//    static let shared = AudioManager()
    
    let firstTic: String = "firstTic"
    let tic: String = "hit-hat"
    var player: AVAudioPlayer?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    
    func startPlayer() {
        //        let firstUrl = Bundle.main.url(forResource: firstTic, withExtension: "mp3")
        guard let url = Bundle.main.url(forResource: tic, withExtension: "wav") else {
            print("Ressource not found")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            //            firstTic = try AVAudioPlayer(contentsOf: firstUrl!)
            player = try AVAudioPlayer(contentsOf: url)
            
            player?.play()
            isPlaying = true
        } catch {
            print("F    ail to initialize player", error)
        }
    }
    
    func Stop() {
        guard let player = player else {
            print("Don't work")
            return
        }
        
        if player.isPlaying {
            print("is playing")
            player.stop()
            isPlaying = false
        }
    }
}
