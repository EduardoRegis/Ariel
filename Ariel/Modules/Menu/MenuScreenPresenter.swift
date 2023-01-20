//
//  MenuScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation

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
    }
    
    func willAppear() {
    }
    
    func didAppear() {
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

