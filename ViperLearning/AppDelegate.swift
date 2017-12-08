//
//  AppDelegate.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentTabBarController(in: window!)
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        //Delete all favorites that need to be deleted before application closes
        let _ = Beer.batchDelete()
    }


}

