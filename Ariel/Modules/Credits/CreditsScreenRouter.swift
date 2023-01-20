//
//  CreditsScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class CreditsScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = CreditsScreenViewController()
        let router = CreditsScreenRouter(viewController: viewController)
        let presenter = CreditsScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func backToMenu() {
        print("BACK TO MENU FROM CREDITS")
        self.pop(animated: true)
    }
}
