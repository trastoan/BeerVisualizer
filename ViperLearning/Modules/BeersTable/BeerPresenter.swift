//
//  PostPresenter.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation

class BeersPresenter: BeersModuleInterface, BeerInteractorOutput {
    
    weak var view: BeersViewInterface?
    var interactor: BeersUseCase!
    var router: BeersRouter!
    
    var beers = [Beer]() {
        didSet {
            beers.count > 0 ? view?.showPostData(beers: beers) : view?.showEmptyState()
        }
    }
    
    func updateView() {
        interactor.fetchBeers(page: 1)
        //Show activity indicator
    }
    
    func getMoreBeers(page: Int) {
        interactor.fetchBeers(page: page)
        //Needs to refactor to append instead then override beers
    }
    
    func showDetailsForBeer(beer: Beer) {
        router.presentDetailsInterfaceForBeer(beer: beer)
    }
    
    func beersFetched(beers: [Beer]) {
        self.beers = beers
        //HideActivityView
    }
    
    internal func beersFetchedFailed() {
        view?.showEmptyState()
        //HideActivity
    }
}
