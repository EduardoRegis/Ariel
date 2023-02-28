//
//  SplashScreenPresenter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import Foundation

protocol SplashScreenPresenterDelegate: BasePresenterDelegate {
}

class SplashScreenPresenter {
    
    weak var delegate: SplashScreenPresenterDelegate?
    let router: SplashScreenRouter
    
    init(delegate: SplashScreenPresenterDelegate, router: SplashScreenRouter) {
        
        self.delegate = delegate
        self.router = router
    }
    func didLoad() {
        checkInternet()
    }
    
    func willAppear() {
    }
    
    func didAppear() {
    }
    
    func navigateToMenu() {
        self.router.navigateToMenu()
    }
    
    @objc func checkInternet() {
        navigateToMenu()
    }
}

