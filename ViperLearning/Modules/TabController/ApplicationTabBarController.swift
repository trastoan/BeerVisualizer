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
        
        let tabBarControllers = [beersController]
        
        self.setViewControllers(tabBarControllers, animated: true)
        beersController.tabBarItem = UITabBarItem(title: "Beers", image: #imageLiteral(resourceName: "beersTab"), tag: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
