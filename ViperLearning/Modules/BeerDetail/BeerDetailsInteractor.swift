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
        
        if let fetchedBeer = Beer.find(with: beer.id) {
            result = fetchedBeer.delete() == nil ? false : true
        } else {
            result = beer.save() == nil ? true : false
        }
        output.favorited(isFavorite: result)
    }
}
