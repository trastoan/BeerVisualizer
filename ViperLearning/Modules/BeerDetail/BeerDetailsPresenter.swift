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
        guard let existsOnDB = Beer.find(with: beer.id) else {
            view?.favorited(isFavorite: false)
            return
        }
        view?.favorited(isFavorite: !existsOnDB.shouldBeDeleted)
    }
    
    func favorited(isFavorite: Bool) {
        view?.favorited(isFavorite: isFavorite)
    }
    
    func saveToFavorites() {
        interactor.saveToFavorites(beer: beer)
    }
}
