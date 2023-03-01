//
//  GameplayScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 28/02/23.
//

import Foundation


protocol GameplayScreenPresenterDelegate: BasePresenterDelegate {
}

class GameplayScreenPresenter {
    
    weak var delegate: GameplayScreenPresenterDelegate?
    let router: GameplayScreenRouter
    
    init(delegate: GameplayScreenPresenterDelegate, router: GameplayScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    func didLoad() {
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func backToMenu() {
        self.router.backToMenu()
    }
}
