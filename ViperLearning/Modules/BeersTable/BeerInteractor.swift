//
//  BeerInteractor.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
import Alamofire

class BeerInteractor: BeersUseCase {
    weak var output: BeerInteractorOutput!
    
    //Fetch beer from API
    func fetchBeers(page: Int) {
        PunkRequests.fetchFromAPI(on: page) { (beers) in
            guard let fetchedBeers = beers else {
                self.output.beersFetchedFailed()
                return
            }
            self.output.beersFetched(beers: fetchedBeers)
        }
    }
}
