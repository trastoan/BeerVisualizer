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
    let endpoint = "https://api.punkapi.com/v2/beers"
    
    weak var output: BeerInteractorOutput!
    
    func fetchBeers(page: Int) {
        let parameters = ["page": page, "per_page": 20]
        guard let url = URL(string: endpoint) else { return }
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (json) in
            guard let data = json.data else { return }
            do {
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                self.output.beersFetched(beers: beers)
            } catch  {
                self.output.beersFetchedFailed()
            }
        }
    }
}
