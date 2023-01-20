//
//  ConfigurationsScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class ConfigurationsScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = ConfigurationsScreenViewController()
        let router = ConfigurationsScreenRouter(viewController: viewController)
        let presenter = ConfigurationsScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func backToMenu() {
        print("BACK TO MENU FROM CONFIGURATIONS")
        self.pop(animated: true)
    }
}
