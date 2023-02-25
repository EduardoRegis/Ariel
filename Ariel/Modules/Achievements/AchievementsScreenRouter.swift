//
//  AchievementsScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 24/02/23.
//

import UIKit

class AchievementsScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = AchievementsScreenViewController()
        let router = AchievementsScreenRouter(viewController: viewController)
        let presenter = AchievementsScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func backToMenu() {
        print("BACK TO MENU FROM ACHIEVEMENTS")
        self.pop(animated: true)
    }
}
