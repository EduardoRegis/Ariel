//
//  AudioManager.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 23/01/23.
//

import AVFoundation

class AudioManager {
    
    static var shared: AudioManager = {
        let instance = AudioManager()
        return instance
    }()
    
    private init() {}
    
    var audioPlayer: AVAudioPlayer?
    
    func playMusic() {
        let pathToFind = Bundle.main.path(forResource: "nierCityRuins", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.setVolume(UserDefaults.standard.float(forKey: "MusicVolume"), fadeDuration: 0)
            audioPlayer?.play()
        } catch {
            // AAAAA
        }
    }
    
    func ajustMusicVolume() {
        audioPlayer?.setVolume(UserDefaults.standard.float(forKey: "MusicVolume"), fadeDuration: 0)
    }
    
    
}
