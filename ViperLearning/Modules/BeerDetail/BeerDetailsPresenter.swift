//
//  BeerDetailsPresenter.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
class BeerDetailsPresenter: DetailsPresentation, DetailsInteractorOutput {
    
    var view: BeerDetailsViewController?
    var beer: Beer!
    var interactor: DetailsUseCase!
    var wireframe: BeerDetailsWireframe!
    
    func viewDidLoad() {
        view?.showDetails(forBeer: beer)
        view?.favorited(isFavorite: Beer.find(with: beer.id) != nil ? true : false)
    }
    
    func favorited(isFavorite: Bool) {
        view?.favorited(isFavorite: isFavorite)
    }
    
    func saveToFavorites() {
        interactor.saveToFavorites(beer: beer)
    }
}
