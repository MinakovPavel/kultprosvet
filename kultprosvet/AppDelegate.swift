//
//  AppDelegate.swift
//  kultprosvet
//
//  Created by Mac on 09.02.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let initialVC = SearchParametersFactory.shared.createModule()
        let navVC = UINavigationController(rootViewController: initialVC)
        self.window?.rootViewController  = navVC
        
        IQKeyboardManager.shared.enable = true
        
        return true
    }
}
