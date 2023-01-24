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
        AudioManager.shared.playAmbient()
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func navigateToGameplay(isNewJourney: Bool) -> UIViewController {
        let swiftUIViewController = UIHostingController(rootView: GameplayCardView())
        UserDefaults.standard.set(isNewJourney, forKey: "isNewJourney")
        swiftUIViewController.modalPresentationStyle = .fullScreen
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

