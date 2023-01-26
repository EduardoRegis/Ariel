//
//  ConfigurationsScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation

protocol ConfigurationsScreenPresenterDelegate: BasePresenterDelegate {
}

class ConfigurationsScreenPresenter {
    
    weak var delegate: ConfigurationsScreenPresenterDelegate?
    let router: ConfigurationsScreenRouter
    
    init(delegate: ConfigurationsScreenPresenterDelegate, router: ConfigurationsScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func ajustVolume(tag: Int, value: Float) {
        switch(tag) {
        case 0:
            UserDefaults.standard.set(value, forKey: "MusicVolume")
            AudioManager.shared.ajustMusicVolume()
        case 1:
            UserDefaults.standard.set(value, forKey: "AmbienceVolume")
            AudioManager.shared.ajustAmbienceVolume()
        case 2:
            UserDefaults.standard.set(value, forKey: "SoundEffectVolume")
            AudioManager.shared.ajustSoundEffectVolume()
        default:
            break
        }
        AudioManager.shared.playSoundEffect(name: "sliderButtonReleased")
       
    }
    
    func backToMenu() {
        self.router.backToMenu()
    }
}
