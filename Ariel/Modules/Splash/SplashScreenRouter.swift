//
//  SplashScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class SplashScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = SplashScreenViewController()
        let router = SplashScreenRouter(viewController: viewController)
        let presenter = SplashScreenPresenter(delegate: viewController, router: router)
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.isNavigationBarHidden = true
        viewController.presenter = presenter
        
        return navigation
    }
    
    func navigateToMenu() {
        self.push(MenuScreenRouter.makeModule(), animated: true)
    }
}
