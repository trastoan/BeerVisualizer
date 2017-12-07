//
//  FavoritesPresenter.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
class FavoritesPresenter: FavoritesModuleInterface, FavoritesInteractorOutput {
    
    weak var view: FavoriteBeersViewController?
    var interactor: FavoritesUseCase!
    var router: FavoritesRouter!
    var beerData = [Beer]() {
        didSet {
            beerData.count > 0 ? view?.showBeersData(beers: beerData) : view?.showEmptyState()
        }
    }
    
    func viewDidLoad() {
        interactor.fetchBeers()
    }
    
    func showDetailsForBeer(beer: Beer) {
        router.presentDetailsInterfaceForBeer(beer: beer)
    }
    
    func beersFetched(beers: [Beer]) {
        beerData = beers
        view?.showBeersData(beers: beerData)
    }
    
    func beersFetchedFailed() {
        view?.showEmptyState()
    }
}
