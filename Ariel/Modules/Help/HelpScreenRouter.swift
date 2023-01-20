//
//  HelpScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class HelpScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = HelpScreenViewController()
        let router = HelpScreenRouter(viewController: viewController)
        let presenter = HelpScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func backToMenu() {
        print("BACK TO MENU FROM HELP")
        self.pop(animated: true)
    }
}
