//
//  RootRouter.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 06/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
class RootRouter: RootWireFrame {
    //Presents the tab bar as rootView of application
    func presentTabBarController(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = ApplicationTabBarController()
    }
}
