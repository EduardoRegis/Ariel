//
//  ArchetypesScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation

protocol ArchetypesScreenPresenterDelegate: BasePresenterDelegate {
}

class ArchetypesScreenPresenter {
    
    weak var delegate: ArchetypesScreenPresenterDelegate?
    let router: ArchetypesScreenRouter
    
    init(delegate: ArchetypesScreenPresenterDelegate, router: ArchetypesScreenRouter) {
        
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

