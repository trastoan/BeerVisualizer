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
    //Request beers to the interactor
    func viewDidLoad() {
        interactor.fetchBeers()
    }
    
    //Show selected beer details with router
    func showDetailsForBeer(beer: Beer) {
        router.presentDetailsInterfaceForBeer(beer: beer)
    }
    
    //Return to view beers fetched and sent trough the output connection on interator
    func beersFetched(beers: [Beer]) {
        beerData = beers
    }
    
    //Warns the view that the fetch has fail
    func beersFetchedFailed() {
        view?.showEmptyState()
    }
}
