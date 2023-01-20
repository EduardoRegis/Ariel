//
//  CreditsScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation

protocol CreditsScreenPresenterDelegate: BasePresenterDelegate {
}

class CreditsScreenPresenter {
    
    weak var delegate: CreditsScreenPresenterDelegate?
    let router: CreditsScreenRouter
    
    init(delegate: CreditsScreenPresenterDelegate, router: CreditsScreenRouter) {
        
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
