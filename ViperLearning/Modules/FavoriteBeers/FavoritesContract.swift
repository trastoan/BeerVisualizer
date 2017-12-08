//
//  FavoritesContract.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
//Creates the contract for all the modules for the Favorite view in the architecture
//Presenter contract
protocol FavoritesModuleInterface: class {
    func viewDidLoad()
    func showDetailsForBeer(beer: Beer)
}
//Interface contract
protocol FavoritesViewInterface: class {
    func showBeersData(beers: [Beer])
    func showEmptyState()
}
//Wireframe contract
protocol FavoritesWireframe {
    weak var view: UIViewController? { get set }
    func presentDetailsInterfaceForBeer(beer: Beer)
    static func assembleModule() -> UIViewController
}
//Interactor contract
protocol FavoritesInteractorInput: class {
    func fetchFavoriteBeers()
}

protocol FavoritesInteractorOutput: class {
    func beersFetched(beers: [Beer])
    func beersFetchedFailed()
}

protocol FavoritesUseCase: class {
    weak var output: FavoritesInteractorOutput! { get set }
    func fetchBeers()
}
