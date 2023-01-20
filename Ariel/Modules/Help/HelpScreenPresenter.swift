//
//  HelpScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation

protocol HelpScreenPresenterDelegate: BasePresenterDelegate {
}

class HelpScreenPresenter {
    
    weak var delegate: HelpScreenPresenterDelegate?
    let router: HelpScreenRouter
    
    init(delegate: HelpScreenPresenterDelegate, router: HelpScreenRouter) {
        
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
