//
//  AppDelegate.swift
//  spiid
//
//  Created by роман поздняков on 01/02/2019.
//  Copyright © 2019 romchick. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let startVC = StartViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = startVC
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        AppSettings.getSettings()
        
        return true
    }
}

