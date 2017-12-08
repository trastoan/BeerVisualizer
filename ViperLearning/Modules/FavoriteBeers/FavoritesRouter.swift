//
//  FavoritesRouter.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class FavoritesRouter: FavoritesWireframe {
    var view: UIViewController?
    
    //Creates the module and connects everything
    static func assembleModule() -> UIViewController {
        let viewController: FavoriteBeersViewController = FavoriteBeersViewController()
        
        let presenter = FavoritesPresenter()
        let interactor = FavoritesInteractor()
        let router = FavoritesRouter()
        
        let navigation = UINavigationController(rootViewController: viewController)
        
        let view = navigation.topViewController as! FavoriteBeersViewController
        
        viewController.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.view = viewController
        
        return navigation
    }
    
    //Show details when beer is selected
    func presentDetailsInterfaceForBeer(beer: Beer) {
        let destinationview = DetailsRouter.assembleModule(beer)
        view?.navigationController?.pushViewController(destinationview, animated: true)
    }
    
}
