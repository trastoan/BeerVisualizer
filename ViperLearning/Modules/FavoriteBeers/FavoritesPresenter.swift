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
        //TODO
    }
    
    func showDetailsForBeer(beer: Beer) {
        //TODO
    }
    
    func beersFetched(beers: [Beer]) {
        beerData = beers
    }
    
    func beersFetchedFailed() {
        view?.showEmptyState()
    }
}
