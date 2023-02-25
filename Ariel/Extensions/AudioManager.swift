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
    
    var musicPlayer: AVAudioPlayer?
    var ambiencePlayer: AVAudioPlayer?
    var soundEffectPlayer: AVAudioPlayer?
    
    func playMusic() {
        let pathToFind = Bundle.main.path(forResource: "nierCityRuins", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer?.setVolume(UserDefaults.standard.float(forKey: "MusicVolume"), fadeDuration: 0)
            musicPlayer?.play()
        } catch {
            // localized
        }
    }
    
    func ajustMusicVolume() {
        musicPlayer?.setVolume(UserDefaults.standard.float(forKey: "MusicVolume"), fadeDuration: 0.2)
    }
    
    func playAmbience() {
        let pathToFind = Bundle.main.path(forResource: "forestSound", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            ambiencePlayer = try AVAudioPlayer(contentsOf: url)
            ambiencePlayer?.setVolume(UserDefaults.standard.float(forKey: "AmbienceVolume"), fadeDuration: 0)
            ambiencePlayer?.numberOfLoops = -1
            ambiencePlayer?.play()
        } catch {
            // localized
        }
    }
    
    func ajustAmbienceVolume() {
        ambiencePlayer?.setVolume(UserDefaults.standard.float(forKey: "AmbienceVolume"), fadeDuration: 0.2)
    }
    
    func playSoundEffect(name: String) {
        let pathToFind = Bundle.main.path(forResource: name, ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
            soundEffectPlayer?.setVolume(UserDefaults.standard.float(forKey: "SoundEffectVolume"), fadeDuration: 0)
            soundEffectPlayer?.play()
        } catch {
            // localized
        }
    }
    
    func ajustSoundEffectVolume() {
        soundEffectPlayer?.setVolume(UserDefaults.standard.float(forKey: "SoundEffectVolume"), fadeDuration: 0.2)
    }
}
