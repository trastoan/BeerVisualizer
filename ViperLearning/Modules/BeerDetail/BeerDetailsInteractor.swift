//
//  BeerDetailsInteractor.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
class BeerDetailsInteractor: DetailsUseCase {
    var output: DetailsInteractorOutput!
    //Save beers to favorite or remove from it, depending on user action
    func saveToFavorites(beer: Beer) {
        var result = false
        if let fetchedBeer = Beer.find(with: beer.id) {
            if fetchedBeer.delete() == nil {
                result = !fetchedBeer.shouldBeDeleted
            }else {
                result = false
            }
        } else {
            let error = beer.save()
            result = error == nil ? true : false
        }
        output.favorited(isFavorite: result)
    }
}
