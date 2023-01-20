//
//  AppDelegate.swift
//  Ariel
//
//  Created by Eduardo Oliveira on 12/01/23.
//

import UIKit

@main class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        return UIWindow()
    }()
    
    static var windowView: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        createContext()
        return true
    }
    
    func createContext() {
        guard let window = self.window else { fatalError("") }
        window.rootViewController = SplashScreenRouter.makeModule()
        window.makeKeyAndVisible()
        AppDelegate.windowView = window
    }
}

