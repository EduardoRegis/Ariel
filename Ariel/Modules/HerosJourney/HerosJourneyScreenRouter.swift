//
//  HerosJourneyScreenRouter.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 20/01/23.
//

import UIKit

class HerosJourneyScreenRouter: BaseRouter {
    
    static func makeModule() -> UIViewController {
        
        let viewController = HerosJourneyScreenViewController()
        let router = HerosJourneyScreenRouter(viewController: viewController)
        let presenter = HerosJourneyScreenPresenter(delegate: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func backToMenu() {
        print("BACK TO MENU FROM HERO`S JOURNEY")
        self.pop(animated: true)
    }
}
