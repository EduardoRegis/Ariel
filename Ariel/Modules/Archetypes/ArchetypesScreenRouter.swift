//
//  ArchetypesScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class ArchetypesScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = ArchetypesScreenViewController()
        let router = ArchetypesScreenRouter(viewController: viewController)
        let presenter = ArchetypesScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func backToMenu() {
        print("BACK TO MENU FROM ARCHETYPES")
        self.pop(animated: true)
    }
}
