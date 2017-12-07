//
//  ApplicationTabBarController.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 06/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class ApplicationTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let beersController = BeersRouter.assembleModule()
        let favoriteBeers = FavoritesRouter.assembleModule()
        
        let tabBarControllers = [beersController, favoriteBeers]
        
        self.setViewControllers(tabBarControllers, animated: true)
        
        favoriteBeers.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "favoriteBeers"), tag: 2)
        beersController.tabBarItem = UITabBarItem(title: "Beers", image: #imageLiteral(resourceName: "beersTab"), tag: 1)
    }
}
