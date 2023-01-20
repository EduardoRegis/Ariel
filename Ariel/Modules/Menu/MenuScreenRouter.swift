//
//  MenuScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class MenuScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = MenuScreenViewController()
        let router = MenuScreenRouter(viewController: viewController)
        let presenter = MenuScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func navigateToHerosJourney() {
        print("GO TO HERO`S JOURNEY")
        self.push(HerosJourneyScreenRouter.makeModule(), animated: true)
    }
    
    func navigateToArchetypes() {
        print("GO TO ARCHETYPES")
        self.push(ArchetypesScreenRouter.makeModule(), animated: true)
    }
    
    func navigateToCredits() {
        print("GO TO CREDITS")
        self.push(CreditsScreenRouter.makeModule(), animated: true)
    }
    
    func navigateToConfigurations() {
        print("GO TO CONFIGURATIONS")
        self.push(ConfigurationsScreenRouter.makeModule(), animated: true)
    }
    
    func navigateToHelp() {
        print("GO TO HELP")
//        self.push(HelpScreenRouter.makeModule(), animated: true)
    }
}
