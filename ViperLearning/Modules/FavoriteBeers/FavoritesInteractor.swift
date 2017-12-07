//
//  FavoritesInteractor.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
class FavoritesInteractor: FavoritesUseCase {
    var output: FavoritesInteractorOutput!
    
    func fetchBeers() {
        guard let beers = Beer.all() else {
            output.beersFetchedFailed()
            return
        }
        output.beersFetched(beers: beers)
    }
    
}
