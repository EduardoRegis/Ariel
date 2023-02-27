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
    
    var achievements: [String] = []
    
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
    
    func getAchievements(completion: @escaping () -> Void) {
        achievements = UserDefaults.standard.stringArray(forKey: "achievements") ?? []
        DispatchQueue.main.async {
            completion()
        }
    }
    
    func backToMenu() {
        self.router.backToMenu()
    }
}

