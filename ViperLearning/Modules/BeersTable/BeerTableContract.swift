//
//  BeerTableContract.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

//Interface contract
protocol BeersViewInterface: class {
    func showPostData(beers: [Beer])
    func showEmptyState()
}

//Presenter contract
protocol BeersModuleInterface: class {
    func updateView()
    func showDetailsForBeer(beer: Beer)
}

protocol BeersUseCase: class {
    weak var output: BeerInteractorOutput! { get set }
    func fetchBeers(page: Int)
}

protocol BeerInteractorOutput: class {
    func beersFetched(beers: [Beer])
    func beersFetchedFailed()
}

//Wireframe Contract
protocol BeersWireframeInput {
    weak var view: UIViewController? { get set }
    
    func presentDetailsInterfaceForBeer(beer: Beer)
    static func assembleModule() -> UIViewController
}

//Interactor Contract
protocol BeerInteractorInput: class {
    func fetchBeers(page: Int)
}

