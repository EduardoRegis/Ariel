//
//  AchievementsScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 24/02/23.
//

import Foundation

protocol AchievementsScreenPresenterDelegate: BasePresenterDelegate {
}

class AchievementsScreenPresenter {
    
    weak var delegate: AchievementsScreenPresenterDelegate?
    let router: AchievementsScreenRouter
    
    init(delegate: AchievementsScreenPresenterDelegate, router: AchievementsScreenRouter) {
        
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
