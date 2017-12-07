//
//  BeerDetailsPresenter.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
class BeerDetailsPresenter: DetailsPresentation {
    var view: BeerDetailsViewController?
    var beer: Beer!
    var wireframe: BeerDetailsWireframe!
    
    func viewDidLoad() {
        view?.showDetails(forBeer: beer)
    }
}
