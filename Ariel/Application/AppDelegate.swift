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
        isFirstOpen()
        return true
    }
    
    func createContext() {
        guard let window = self.window else { fatalError("") }
        window.rootViewController = SplashScreenRouter.makeModule()
        window.makeKeyAndVisible()
        AppDelegate.windowView = window
    }
    
    func isFirstOpen() {
        if let firstOpen = UserDefaults.standard.object(forKey: "FirstOpen") as? Date {
            print("\("Este app foi aberto pela primeira vez em (localized)") \(firstOpen)")
        } else {
            print("Abrindo pela primeira vez (localized)")
            UserDefaults.standard.set(Date(), forKey: "FirstOpen")
            
            UserDefaults.standard.set(0.5, forKey: "SoundEffectVolume")
            UserDefaults.standard.set(0.5, forKey: "AmbientVolume")
            UserDefaults.standard.set(0.5, forKey: "MusicVolume")
            
            UserDefaults.standard.set(0, forKey: "activeHerosJourney")
            UserDefaults.standard.set(0, forKey: "activeArchetypes")
        }
    }
}

