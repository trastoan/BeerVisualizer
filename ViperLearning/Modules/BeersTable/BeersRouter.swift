//
//  BeersRouter.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class BeersRouter: BeersWireframeInput {
    var view: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let viewController: BeersViewController = BeersViewController()
        let presenter = BeersPresenter()
        let interactor = BeerInteractor()
        let router = BeersRouter()
        
        let navigation = UINavigationController(rootViewController: viewController)
        let view = navigation.childViewControllers.first as! BeersViewController
        
        viewController.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.view = view
        
        return navigation
    }
    
    func presentDetailsInterfaceForBeer(beer: Beer) {
        let destinationview = DetailsRouter.assembleModule(beer)
        view?.navigationController?.pushViewController(destinationview, animated: true)
    }
}
