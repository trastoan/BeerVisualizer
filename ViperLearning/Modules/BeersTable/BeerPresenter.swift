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
    //Decides on didSet which function will call from view
    var beers = [Beer]() {
        didSet {
            beers.count > 0 ? view?.showBeersData(beers: beers) : view?.nothingToFetch()
        }
    }
    
    //Request data to interactor for the firs time
    func updateView() {
        interactor.fetchBeers(page: 1)
    }
    
    //Request next page itens from server
    func getMoreBeers(page: Int) {
        interactor.fetchBeers(page: page)
    }
    
    //Send to router the need to show beer details
    func showDetailsForBeer(beer: Beer) {
        router.presentDetailsInterfaceForBeer(beer: beer)
    }
    
    //Set the object to match the output from Interactor
    func beersFetched(beers: [Beer]) {
        self.beers = beers
    }
    
    //Send a signal to view that the fetched has failed
    internal func beersFetchedFailed() {
        view?.nothingToFetch()
    }
}
