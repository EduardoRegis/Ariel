//
//  GameplayScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 28/02/23.
//

import UIKit

class GameplayScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = GameplayScreenViewController()
        let router = GameplayScreenRouter(viewController: viewController)
        let presenter = GameplayScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func backToMenu() {
        print("BACK TO MENU FROM GAMEPLAY")
        self.pop(animated: true)
    }
}