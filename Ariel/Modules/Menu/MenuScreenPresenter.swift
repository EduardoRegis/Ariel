//
//  MenuScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation
import SwiftUI

protocol MenuScreenPresenterDelegate: BasePresenterDelegate {
}

class MenuScreenPresenter {
    
    weak var delegate: MenuScreenPresenterDelegate?
    let router: MenuScreenRouter
    
    init(delegate: MenuScreenPresenterDelegate, router: MenuScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    func didLoad() {
        AudioManager.shared.playMusic()
        AudioManager.shared.playAmbience()
    }
    
    func willAppear() {
    }
    
    func didAppear() {
        
        let userDefaults = UserDefaults.standard
        
        print("\nbabaca ", userDefaults.integer(forKey: "duchbagCounter"))
        print("hero's Journey ", userDefaults.integer(forKey: "activeHerosJourney"))
        print("archetypes ", userDefaults.integer(forKey: "activeArchetypes"))
        print("archievements", userDefaults.stringArray(forKey: "archievements"))
        
        SnackBarHelper.shared.showSuccessMessage(message: "teste")
    }
    
    func navigateToGameplay(isNewJourney: Bool) -> UIViewController {
        let swiftUIViewController = UIHostingController(rootView: GameplayCardView())
        UserDefaults.standard.set(isNewJourney, forKey: "isNewJourney")
        swiftUIViewController.modalPresentationStyle = .fullScreen
        if isNewJourney == true {
            UserDefaults.standard.set(0, forKey: "duchbagCounter")
        }
        return swiftUIViewController
    }
    
    func navigateToHerosJourney() {
        self.router.navigateToHerosJourney()
    }
    
    func navigateToArchetypes() {
        self.router.navigateToArchetypes()
    }
    
    func navigateToCredits() {
        self.router.navigateToCredits()
    }
    
    func navigateToConfigurations() {
        self.router.navigateToConfigurations()
    }
    
    func navigateToHelp() {
        self.router.navigateToHelp()
    }
}

