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
            return "Avaliador, Roteirista, Ilustrador"
        case 1:
            return "Revisor, Ilustrador, Designer de Som"
        case 2:
            return "Programador"
        case 3:
            return "Líder, Roteirista, Ilustradora"
        case 4:
            return "Designer de Personagem, Designer de\n Interface, Ilustrador"
        case 5:
            return "Designer de Interface, Designer UX"
        default:
            return ""
        }
    }
    
    func backToMenu() {
        self.router.backToMenu()
    }
}
