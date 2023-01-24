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
    var ambientPlayer: AVAudioPlayer?
    var soundEffectPlayer: AVAudioPlayer?
    
    func playMusic() {
        let pathToFind = Bundle.main.path(forResource: "nierCityRuins", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
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
    
    func playAmbient() {
        let pathToFind = Bundle.main.path(forResource: "forestSound", ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
            ambientPlayer = try AVAudioPlayer(contentsOf: url)
            ambientPlayer?.setVolume(UserDefaults.standard.float(forKey: "AmbientVolume"), fadeDuration: 0)
            ambientPlayer?.numberOfLoops = -1
            ambientPlayer?.play()
        } catch {
            // localized
        }
    }
    
    func ajustAmbientVolume() {
        ambientPlayer?.setVolume(UserDefaults.standard.float(forKey: "AmbientVolume"), fadeDuration: 0.2)
    }
    
    func playSoundEffect(name: String) {
        let pathToFind = Bundle.main.path(forResource: name, ofType: "mp3")!
        let url = URL(fileURLWithPath: pathToFind)
        
        do {
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
