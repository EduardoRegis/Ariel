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
    
    func memberFunction(index: Int) -> String {
        switch index {
        case 0:
            return CreditsScreenTexts.first.localized()
        case 1:
            return CreditsScreenTexts.second.localized()
        case 2:
            return CreditsScreenTexts.third.localized()
        case 3:
            return CreditsScreenTexts.fourth.localized()
        case 4:
            return CreditsScreenTexts.fifth.localized()
        case 5:
            return CreditsScreenTexts.sixth.localized()
        default:
            return ""
        }
    }
    
    func backToMenu() {
        self.router.backToMenu()
    }
}
