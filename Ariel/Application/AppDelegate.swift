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
            print("\(FirstOpenTexts.notFirstOpen.localized()) \(firstOpen)")
        } else {
            print(FirstOpenTexts.firstOpen.localized())
            
            let userDefaults = UserDefaults.standard
            
            userDefaults.set(Date(), forKey: "FirstOpen")
            
            userDefaults.set(0.5, forKey: "SoundEffectVolume")
            userDefaults.set(0.5, forKey: "AmbienceVolume")
            userDefaults.set(0.5, forKey: "MusicVolume")
            
            userDefaults.set(0, forKey: "activeHerosJourney")
            userDefaults.set(0, forKey: "activeArchetypes")
            userDefaults.set(0, forKey: "duchbagCounter")
            
            userDefaults.set(false, forKey: "gameInProgress")
            
            let array: [String] = []
            userDefaults.set(array, forKey: "archievements")
        }
    }
}

