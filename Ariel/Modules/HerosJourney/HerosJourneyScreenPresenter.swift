//
//  HerosJourneyScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation

protocol HerosJourneyScreenPresenterDelegate: BasePresenterDelegate {
}

class HerosJourneyScreenPresenter {
    
    weak var delegate: HerosJourneyScreenPresenterDelegate?
    let router: HerosJourneyScreenRouter
    
    init(delegate: HerosJourneyScreenPresenterDelegate, router: HerosJourneyScreenRouter) {
        
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

