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
    
    func saveToFavorites(beer: Beer) {
        var result = false
        let favoriteBeer = beer.copy() as! Beer
        if let fetchedBeer = Beer.find(with: favoriteBeer.id) {
            result = fetchedBeer.delete() == nil ? false : true
        } else {
            result = favoriteBeer.save() == nil ? true : false
        }
        output.favorited(isFavorite: result)
    }
}
