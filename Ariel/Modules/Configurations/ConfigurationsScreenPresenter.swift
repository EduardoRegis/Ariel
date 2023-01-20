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
    
    func backToMenu() {
        self.router.backToMenu()
    }
}
