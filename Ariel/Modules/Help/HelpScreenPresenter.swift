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
    
    func helpTitle(index: Int) -> String {
        switch index {
        case 0:
            return "Fazer Escolha"
        case 1:
            return "Acessar Jornada"
        case 2:
            return "Lorem Ipsum"
        case 3:
            return "Lorem Ipsum"
        default:
            return ""
        }
    }
    
    func helpImage(index: Int) -> String {
        switch index {
        case 0:
            return "smd_logo"
        case 1:
            return "smd_logo"
        case 2:
            return "smd_logo"
        case 3:
            return "smd_logo"
        default:
            return ""
        }
    }
    
    func helpDescription(index: Int) -> String {
        switch index {
        case 0:
            return "Para fazer sua escolha, mova o mouse da esquerda para a direita para ver as opções. Clique na tela para escolher aquela opção."
        case 1:
            return "Para acessar a aba de Jornada do Herói basta clicar na barra superior, onde está escrito o nome do capítulo."
        case 2:
            return "Para fazer sua escolha, mova o mouse da esquerda para a direita para ver as opções. Clique na tela para escolher aquela opção."
        case 3:
            return "Para fazer sua escolha, mova o mouse da esquerda para a direita para ver as opções. Clique na tela para escolher aquela opção."
        default:
            return ""
        }
    }
    
    func backToMenu() {
        self.router.backToMenu()
    }
}
