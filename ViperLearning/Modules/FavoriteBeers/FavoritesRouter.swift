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
    
    static func assmbleModule() -> UIViewController {
        let viewController: FavoriteBeersViewController = FavoriteBeersViewController.instatiate(fromStoryboard: "Main")
        
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
    
    func presentDetailsInterfaceForBeer(beer: Beer) {
        let destinationview = DetailsRouter.assembleModule(beer)
        view?.navigationController?.pushViewController(destinationview, animated: true)
    }
    
}
